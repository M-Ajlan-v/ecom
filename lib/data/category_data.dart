import 'package:ecom/models/category_model.dart';
import 'package:flutter/material.dart';

final List<CategoryModel> categoryList = [

  CategoryModel(
    icon: Icons.settings_outlined,
    iconColor: const Color.fromARGB(255, 4, 28, 247),
    iconBg: Colors.blue.shade50,
    title: "Engine Parts",
  ),

  CategoryModel(
    icon: Icons.speed_outlined,
    iconColor: const Color.fromARGB(255, 215, 16, 2),
    iconBg: Colors.red.shade50,
    title: "Brake System",
  ),

  CategoryModel(
    icon: Icons.electric_bolt_outlined,
    iconColor: const Color.fromARGB(255, 241, 181, 0),
    iconBg: Colors.amber.shade50,
    title: "Electrical",
  ),

  CategoryModel(
    icon: Icons.car_repair_outlined,
    iconColor: const Color.fromARGB(255, 157, 0, 184),
    iconBg: Colors.purple.shade50,
    title: "Suspension",
  ),

  CategoryModel(
    icon: Icons.shield_outlined,
    iconColor: const Color.fromARGB(255, 34, 156, 1),
    iconBg: Colors.green.shade50,
    title: "Body Parts",
  ),

  CategoryModel(
    icon: Icons.lightbulb_outline,
    iconColor: Colors.indigo,
    iconBg: Colors.indigo.shade50,
    title: "Interior",
  ),

];