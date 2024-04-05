// ignore_for_file: dead_code

import 'package:factory_api/features/api_bloc/bloc/api_bloc.dart';
import 'package:factory_api/features/api_bloc/models/message_model.dart';
import 'package:factory_api/features/api_bloc/models/response_model.dart';
import 'package:factory_api/new_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponsesList extends StatefulWidget {
  const ResponsesList({super.key});

  @override
  State<ResponsesList> createState() => _ResponsesListState();
}

class _ResponsesListState extends State<ResponsesList> {
  @override
  Widget build(BuildContext context) {
    final ResponseModel dummyResponse = ResponseModel(
      status: 200,
      error: false,
      message: MessageModel(
        id: 'jklaSAfasefJKfaSLAN#bahbklafeAIOFel',
        user_name: 'steve123',
        first_name: 'Steve',
        second_name: 'Harrington',
        first_last_name: 'Damiano',
        second_last_name: 'David',
        cellphone: '0 123 123 45 67',
        email: 'steveHarington@gmail.com',
        jwt: 'bkbFKEBS;FAAKFESFFSELKFNELNFQNefnhwolfnwolnfwlfnlwfnwl;ne;fwnfl;kwenfwkl;nfwelkfnewl;kf',
      ),
      current_url: '123',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NewRequest()));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: false
          ? BlocBuilder<ApiBloc, ApiBlocState>(
              builder: (context, state) {
                if (state is ApiLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is ApiLoadedState) {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      ResponseModel item = state.data[index];
                      return ListTile(
                        title: Text(item.status.toString()),
                        // Other properties of the item
                      );
                    },
                  );
                } else if (state is ApiErrorState) {
                  return Text('Error: ${state.errorMessage}');
                }
                return Container(); // Initial or unknown state
              },
            )
          : ListView.builder(itemBuilder: (context, index) {}),
    );
  }
}
