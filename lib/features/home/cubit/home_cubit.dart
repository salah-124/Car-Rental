import 'package:bloc/bloc.dart';
import 'package:car_rental/services/supa_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getCars();
  }

  final SupaService supaService = SupaService();

  final brands = [
    'All',
    'Toyota',
    'Honda',
    'Ford',
    'Chevrolet',
    'Nissan',
  ];

  String selectedBrand = 'All';

  List<Map<String, dynamic>> cars = [];

  Future<void> getCars() async {
    emit(HomeLoading());

    try {
      cars = await supaService.getCars();
      emit(HomeSuccess(cars));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void filterCars(String brand) {
    selectedBrand = brand;

    final filtered = brand == 'All'
        ? cars
        : cars.where((car) => car['brand'] == brand).toList();

    emit(HomeSuccess(filtered));
  }
}