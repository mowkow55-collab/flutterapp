import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/utils/constants.dart';
import '../models/book_model.dart';

abstract class BooksRemoteDataSource {
  Future<List<BookModel>> getBooks();
  Future<BookModel> getBookById(String id);
}

class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  final SupabaseClient supabaseClient;

  BooksRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<List<BookModel>> getBooks() async {
    final response = await supabaseClient
        .from(AppConstants.booksTable)
        .select()
        .order('title', ascending: true);
        
    return response.map((json) => BookModel.fromJson(json)).toList();
  }

  @override
  Future<BookModel> getBookById(String id) async {
    final response = await supabaseClient
        .from(AppConstants.booksTable)
        .select()
        .eq('id', id)
        .single();
    
    return BookModel.fromJson(response);
  }
}
