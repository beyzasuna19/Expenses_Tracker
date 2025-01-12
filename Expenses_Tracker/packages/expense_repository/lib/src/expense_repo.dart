import 'package:expense_repository/expense_repository.dart';
import 'package:expense_repository/src/models/expense.dart'; // Fixed the incorrect file name

abstract class ExpenseRepository {
  /// Creates a new category.
  Future<void> createCategory(Category category);

  /// Fetches a list of categories.
  Future<List<Category>> getCategory();

  /// Creates a new expense.
  Future<void> createExpense(Expense expense); // Added the correct type for 'expense'

  /// Fetches a list of expenses.
  Future<List<Expense>> getExpenses();
}
