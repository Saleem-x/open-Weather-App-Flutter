import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather/core/constents/styles.dart';
import 'package:weather/feature/data/models/weather_model/main.dart';
import 'package:weather/feature/state/bloc/bloc/getuserweather_bloc.dart';
import 'package:weather/feature/views/main/widgets/climatetempwidget.dart';
import 'package:weather/feature/views/main/widgets/moreinfowidget.dart';
import 'package:weather/feature/views/main/widgets/searchwidget.dart';
import 'package:weather/feature/views/main/widgets/weathericon.dart';
import 'widgets/basicinfowidget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetuserweatherBloc>().add(const Getinitialweather());
    return Scaffold(
      backgroundColor: kcolordark,
      body: BlocConsumer<GetuserweatherBloc, GetuserweatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.when(
            inittialweather: (weather) => weather == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: SearchWidget(),
                      ),
                      BaseInfoWidget(weather: weather),
                      WeatherIconWidget(weather: weather),
                      ClimateandTemp(weather: weather),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            child: Divider(),
                          )
                        ],
                      ),
                      MoreInfoWidget(
                        weather: weather,
                      )
                    ],
                  ),
            failurestate: () => const SizedBox(),
            searchfoundstate: (weather) => weather == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                              onPressed: () {
                                context
                                    .read<GetuserweatherBloc>()
                                    .add(const Getinitialweather());
                              },
                              icon: const Icon(
                                Iconsax.location,
                                color: kcolorwhite,
                              ),
                              label: Text(
                                'Back to Home',
                                style: kprimaryfont(
                                    fontSize: 17, color: kwhiteshade),
                              ))
                        ],
                      ),
                      BaseInfoWidget(weather: weather),
                      WeatherIconWidget(weather: weather),
                      ClimateandTemp(weather: weather),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            child: Divider(),
                          )
                        ],
                      ),
                      MoreInfoWidget(
                        weather: weather,
                      )
                    ],
                  ),
            searchnotfoundState: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'City Not Found',
                    style: kprimaryfont(fontSize: 17, color: kwhiteshade),
                  ),
                  TextButton.icon(
                      onPressed: () {
                        context
                            .read<GetuserweatherBloc>()
                            .add(const Getinitialweather());
                      },
                      icon: const Icon(
                        Iconsax.location,
                        color: kcolorwhite,
                      ),
                      label: Text(
                        'Back to Home',
                        style: kprimaryfont(fontSize: 17, color: kwhiteshade),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
