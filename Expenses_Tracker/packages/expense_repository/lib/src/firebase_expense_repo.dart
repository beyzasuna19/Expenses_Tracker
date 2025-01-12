import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:expense_repository/src/entities/category_entity.dart';
import 'package:expense_repository/src/entities/expense_entity.dart'; // Ensure ExpenseEntity is correctly imported
import 'package:expense_repository/src/models/category.dart'; // Import the correct Category model
import 'package:expense_repository/src/models/expense.dart'; // Import the correct Expense model

class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryCollection = FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');

  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log("Error creating category: $e");
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      final snapshot = await categoryCollection.get();
      return snapshot.docs.map((doc) {
        return Category.fromEntity(
          CategoryEntity.fromDocument(doc.data()),
        );
      }).toList();
    } catch (e) {
      log("Error fetching categories: $e");
      rethrow;
    }
  }

  @override
  Future<void> createExpense(Expense expense) async {
    try {
      await expenseCollection
          .doc(expense.expenseId)
          .set(expense.toEntity().toDocument());
    } catch (e) {
      log("Error creating expense: $e");
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpenses() async {
    try {
      final snapshot = await expenseCollection.get();
      return snapshot.docs.map((doc) {
        return Expense.fromEntity(
          ExpenseEntity.fromDocument(doc.data()),
        );
      }).toList();
    } catch (e) {
      log("Error fetching expenses: $e");
      rethrow;
    }
  }
}
