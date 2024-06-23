import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/core/widgets/custom_hotel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(appTranslation(context).search),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: cubit.searchController,
                  decoration: InputDecoration(
                    labelText: appTranslation(context).search,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        cubit.searchHotels();
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter your product name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String text) {
                    cubit.searchHotels();
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                if (state is SearchLoadingState) const LinearProgressIndicator(),
                if (cubit.facilitiesModel != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 16.0,
                        children: [
                          ...cubit.facilitiesModel!.data!
                              .asMap()
                              .map(
                                (key, value) => MapEntry(
                                  key,
                                  InkWell(
                                    onTap: () {
                                      cubit.selectFacility(value.id);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: cubit.selectedFacilities.any((element) => element == value.id)
                                            ? AppColors.primary
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Image.network(value.image),
                                          ),
                                          const Spacer(),
                                          Text(
                                            value.name,
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .values
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                if (cubit.searchHotelsModel != null)
                  Text("${cubit.searchHotelsModel!.data.data.length.toString()} Hotels"),
                if (cubit.searchHotelsModel != null)
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => CustomHotelCard(
                        item: cubit.searchHotelsList![index],
                      ),
                      itemCount: cubit.searchHotelsList!.length,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
