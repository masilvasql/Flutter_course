// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:io';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'models/transaction.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);

    final ThemeData tema = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          bodyText2: TextStyle(
            color: Colors.black,
            fontFamily: 'QuickSand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryTextTheme: tema.primaryTextTheme.copyWith(
          bodyText1: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: 'QuickSand'),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'QuickSand',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((tr) => tr.date.isAfter(DateTime.now().subtract(
              Duration(days: 7),
            )))
        .toList();
  }

  _addTranscation(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); // elimina um widget da pilha
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTranscation);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    Widget _getIconButton(IconData icon, Function() fn) {
      return Platform.isIOS
          ? GestureDetector(onTap: fn, child: Icon(icon))
          : IconButton(icon: Icon(icon), onPressed: fn);
    }

    final iconList = Platform.isIOS ? CupertinoIcons.square_list : Icons.list;
    final iconChart = Platform.isIOS
        ? CupertinoIcons.chart_bar_alt_fill
        : Icons.bar_chart_rounded;

    final actions = [
      if (isLandscape)
        _getIconButton(_showChart ? iconList : iconChart, () {
          setState(() {
            _showChart = !_showChart;
          });
        }),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      ),
    ];

    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * mediaQuery.textScaleFactor,
        ),
      ),
      toolbarTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      actions: actions,
    );

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context)
            .padding
            .top; // Calculando o tamanho disponivel da tela desconsiderando appBar

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Switch.adaptive(value: true, onChanged: (value) {}), Adaptative = se adapta de acordo com a plataforma
            if (_showChart || !isLandscape)
              SizedBox(
                height: availableHeight * (isLandscape ? 0.8 : 0.3),
                child: Chart(_recentTransactions),
              ),
            if (!_showChart || !isLandscape)
              SizedBox(
                height: availableHeight * (isLandscape ? 1 : 0.7),
                child: TransactionList(
                    transactions: _transactions, onRemove: _removeTransaction),
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: !isLandscape && Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _openTransactionFormModal(context),
                    child: Icon(Icons.add),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
