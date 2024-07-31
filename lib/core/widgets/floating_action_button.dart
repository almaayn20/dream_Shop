import 'package:flutter/material.dart';

FloatingActionButton faButton(
    {required String text,
    required IconData icon,
    required void Function() func}) {
  return FloatingActionButton.extended(
    onPressed: func,
    icon: Icon(icon),
    label: Text(text),
  );
}
