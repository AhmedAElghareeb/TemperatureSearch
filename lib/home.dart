import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of(context)..getData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Weather", style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.tealAccent,
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is GetWeatherLoadingState)
          {
            return const Center(child: CircularProgressIndicator(),);
          } else if (state is GetWeatherFailedState)
          {
            return Text(state.msg);
          } else if (state is GetWeatherSuccessState)
          {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: cubit.cityController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  const SizedBox(height: 15.0,),
                  MaterialButton(
                    onPressed: (){
                      cubit.getData();
                    },
                    color: Colors.lightBlueAccent,
                    minWidth: 150.0,
                    child: const Text("Get Weather..", style: TextStyle(fontSize: 16.0),),
                  ),
                  const SizedBox(height: 15.0,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Name is: ${cubit.model!.name}",
                      ),
                      const SizedBox(height: 16.0,),
                      Text("Temp is: ${cubit.model!.main.temp.toString()}",
                      ),
                      const SizedBox(height: 16.0,),
                      Text("Min Temp is: ${cubit.model!.main.tempMin.toString()}",
                      ),
                      const SizedBox(height: 16.0,),
                      Text("Max Temp is: ${cubit.model!.main.tempMax.toString()}",
                      ),
                      const SizedBox(height: 16.0,),
                      Text("Pressure is: ${cubit.model!.main.pressure.toString()}",
                      ),
                      const SizedBox(height: 16.0,),
                      Text("Humidity is: ${cubit.model!.main.humidity.toString()}",
                      ),
                      const SizedBox(height: 16.0,),
                      Text("Feels Like is: ${cubit.model!.main.feelsLike.toString()}",
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Text("Failed");
          }
        },
      ),
    );
  }
}


