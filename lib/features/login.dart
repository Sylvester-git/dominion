import 'dart:developer';

import 'package:dominion/features/cubit/get_sensor_data_cubit.dart';
import 'package:dominion/features/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getsensordatacubit = context.watch<GetSensorDataCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Input your user ID', style: TextStyle(fontSize: 16)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Inout field cannot be empty";
                  }
                  return null;
                },
                controller: _controller,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(.4),
                ),
              ),
              BlocListener<GetSensorDataCubit, GetSensorDataState>(
                listener: (context, state) {
                  if (state is GetSensorDataError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.failure.message)),
                    );
                  }
                  if (state is GetSensorDataLoaded) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed:
                      getsensordatacubit.state is GetSensorDataLoading
                          ? null
                          : () {
                            if (_globalKey.currentState!.validate()) {
                              context.read<GetSensorDataCubit>().getSensorData(
                                uid: _controller.text,
                              );
                            }
                          },

                  child:
                      getsensordatacubit.state is GetSensorDataLoading
                          ? Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 0.5,
                              ),
                            ),
                          )
                          : Center(
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
