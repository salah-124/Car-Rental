import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class SupaService {
  final supaAuth = Supabase.instance.client.auth;
  final supa = Supabase.instance.client;

  // Sign Up

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supaAuth.signUp(email: email, password: password);
      print(response);
      return response;
    } catch (e) {
      print('Error signing up: $e');
      rethrow;
    }
  }
  // Sign in

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supaAuth.signInWithPassword(
        email: email,
        password: password,
      );
      print(response);
      return response;
    } catch (e) {
      print('Error signing in: $e');
      rethrow;
    }
  }

  // Logout

  Future<void> signOut() async {
    try {
      final response = await supaAuth.signOut();
      return response;
    } catch (e) {
      print('Error signing out: $e');
      rethrow;
    }
  }

  // Add Car

  Future<void> addCar({
    required String model,
    required String price,
    required String engine,
    required String speed,
    required String seats,
    required String brand,
    required File image,
  }) async {
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

    await supa.storage.from('car_rental').upload(fileName, image);

    final imageUrl = supa.storage.from('car_rental').getPublicUrl(fileName);

    await supa.from('cars').insert({
      'model': model,
      'price': price,
      'engine': engine,
      'speed': speed,
      'seats': seats,
      'brand': brand,
      'image_url': imageUrl,
    });
  }

  // selcet
  Future<List<Map<String, dynamic>>> getCars() => supa.from('cars').select();
}
