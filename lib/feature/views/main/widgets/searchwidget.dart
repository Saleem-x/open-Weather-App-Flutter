import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constents/styles.dart';
import 'package:weather/feature/state/bloc/bloc/getuserweather_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

final TextEditingController _searchcontroller = TextEditingController();

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: _searchcontroller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            hintText: 'Search a City',
            suffix: IconButton(
                onPressed: () {
                  if (_searchcontroller.text.isNotEmpty) {
                    context
                        .read<GetuserweatherBloc>()
                        .add(SearchCityEvent(city: _searchcontroller.text));
                  }
                },
                icon: const Icon(
                  Icons.search,
                  color: kcolorwhite,
                ))),
      ),
    );
  }
}
