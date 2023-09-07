import 'package:flutter/material.dart';
import 'package:my_app/styles/text_style.dart';

Widget currentWeather(
    String icon, String temp, String cityName, String humidity, String wind) {
  return Center(
    child: Column(
      children: [
        const Spacer(),
        Image.network('https://openweathermap.org/img/wn/$icon@2x.png'),
        const SizedBox(
          height: 30,
        ),
        Text(
          '$temp°',
          style: AppStyle.tempStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          cityName,
          style: AppStyle.countryStyle,
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$humidity% \nHumidity',
                style: AppStyle.additionalStyle,
              ),
              const SizedBox(width: 50),
              Text('$wind km/h \nWind Speed ', style: AppStyle.additionalStyle),
            ],
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}
