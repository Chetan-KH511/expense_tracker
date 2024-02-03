//A third party dart package which generates unique id check @https://pub.dev/packages/uuid
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, stationary, college }

const categoryIcons = {
  Category.food: Icons.dining_outlined,
  Category.travel: Icons.monetization_on,
  Category.stationary: Icons.note_alt_rounded,
  Category.college: Icons.school
};

class Expense {
  Expense({
    required this.date,
    required this.title,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();
//constructor():___; is known as initializer list to initialize class props which are not recieved as constructor func arguments

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatteddate{
    return formatter.format(date);
  }
}
