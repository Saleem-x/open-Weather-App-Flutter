import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/constents/styles.dart';
import 'package:weather/feature/state/bloc/bloc/getuserweather_bloc.dart';
import 'package:weather/feature/views/widgets/weathericon.dart';

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
                      Row(
                        children: [],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                weather.name!,
                                textAlign: TextAlign.center,
                                style: kprimaryfont(
                                    fontSize: 32, color: kwhiteshade),
                              ),
                              Text(
                                DateFormat('dd/MMMM/y').format(DateTime.now()),
                                style: kprimaryfont(
                                    fontSize: 18, color: kwhiteshade),
                              ),
                              Text(
                                DateFormat('hh:mm a').format(DateTime.now()),
                                style: kprimaryfont(
                                    fontSize: 18, color: kwhiteshade),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(),
                        child: getWeatherIcon(weather.weather![0].icon!),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${weather.main!.temp!.toInt() - 271}°C',
                                textAlign: TextAlign.center,
                                style: kprimaryfont(
                                    fontSize: 32, color: kwhiteshade),
                              ),
                              Text(
                                weather.weather![0].description!,
                                textAlign: TextAlign.center,
                                style: kprimaryfont(
                                    fontSize: 17, color: kwhiteshade),
                              ),
                              Text(
                                DateTime.now().hour >= 5 &&
                                        DateTime.now().hour < 12
                                    ? 'Good Morning'
                                    : DateTime.now().hour >= 12 &&
                                            DateTime.now().hour < 17
                                        ? 'Good Afternoon'
                                        : DateTime.now().hour >= 17 &&
                                                DateTime.now().hour < 21
                                            ? 'Good Evening'
                                            : 'Good Night',
                                style: kprimaryfont(
                                    fontSize: 18, color: kwhiteshade),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            child: Divider(),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.sunny,
                                color: kwhiteshade,
                              ),
                              Text(
                                'sunrise',
                                style: kprimaryfont(
                                    fontSize: 13, color: kwhiteshade),
                              ),
                              Text(
                                  DateFormat('hh:mm a').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weather.sys!.sunrise! * 1000,
                                        isUtc: false),
                                  ),
                                  style: kprimaryfont(
                                      fontSize: 17, color: kwhiteshade))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Iconsax.wind,
                                color: kwhiteshade,
                              ),
                              Text(
                                'Wind',
                                style: kprimaryfont(
                                    fontSize: 13, color: kwhiteshade),
                              ),
                              Text("${weather.wind!.speed! * 3.6}",
                                  style: kprimaryfont(
                                      fontSize: 17, color: kwhiteshade))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FontAwesomeIcons.droplet,
                                color: kwhiteshade,
                              ),
                              Text(
                                'Humidity',
                                style: kprimaryfont(
                                    fontSize: 13, color: kwhiteshade),
                              ),
                              Text('${weather.main!.humidity!}%',
                                  style: kprimaryfont(
                                      fontSize: 17, color: kwhiteshade))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
            failurestate: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
