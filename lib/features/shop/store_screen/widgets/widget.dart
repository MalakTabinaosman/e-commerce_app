 
 
 
import 'package:flutter/material.dart';

Widget _buildTabContent(String title) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: 50,
      itemBuilder: (context, index) => ListTile(title: Text('$title $index')),
    );
  }
