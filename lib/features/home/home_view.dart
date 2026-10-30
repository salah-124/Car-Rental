import 'package:car_rental/features/home/cubit/home_cubit.dart';
import 'package:car_rental/features/home/widgets/coustom_app_bar.dart';
import 'package:car_rental/features/home/widgets/coustom_car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Gap(50),

              CoustomAppBar(
                image: 'assets/me.jpg',
                location: 'Boston, NewYork',
                name: 'Salah Ayman',
                onPressed: () {},
              ),

              const Gap(20),

              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final cubit = context.read<HomeCubit>();

                  return SizedBox(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.brands.length,
                      itemBuilder: (context, index) {
                        final brand = cubit.brands[index];

                        return GestureDetector(
                          onTap: () => cubit.filterCars(brand),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: cubit.selectedBrand == brand
                                  ? Colors.white
                                  : Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                brand,
                                style: TextStyle(
                                  color: cubit.selectedBrand == brand
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              const Gap(15),

              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is HomeError) {
                      return Center(
                        child: Text(
                          state.error,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    if (state is HomeSuccess) {
                      if (state.cars.isEmpty) {
                        return const Center(
                          child: Text(
                            'No cars found',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        );
                      }

                      return GridView.builder(
                        itemCount: state.cars.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: .68,
                            ),
                        itemBuilder: (context, index) {
                          final car = state.cars[index];
                          final isLoading = state is HomeLoading;
                          return isLoading
                              ? CircularProgressIndicator()
                              : CoustomCarCard(
                                  carImage: car['image_url'],
                                  carBrand: car['brand'],
                                  speed: car['speed'],
                                  price: car['price'],
                                  onPressed: () {},
                                );
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
