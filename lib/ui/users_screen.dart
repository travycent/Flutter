import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_flutter_app/bloc/user_bloc.dart';
import 'package:second_flutter_app/models/pagination_model.dart';
import 'package:second_flutter_app/models/user_item_model.dart';
import 'package:second_flutter_app/models/user_response_model.dart';

class UserScreen extends StatefulWidget {
  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    userBloc.fetchUser();
    return StreamBuilder(
        stream: userBloc.user,
        builder: (context, AsyncSnapshot<UserResponse> snapshot) {
          if (snapshot.hasData) {
            return _buildWeatherScreen(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
  Container _buildWeatherScreen(UserResponse data) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildUser(data.user),
          _buildPagination(data.pagination),
        ],
      ),
    );
  }
  Column _buildUser(List<User> user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Users List",
            style: TextStyle(
                color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),

        //Text("username: " + user.username.toString()),
        //Text("First Name: " + user.firstName.toString()),
       // Text("Last Name: " + user.lastName.toString())},
      ],
    );
  }

  Column _buildPagination(Pagination pagination) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Pagination",
            style: TextStyle(
                color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
        Text("Count: " + pagination.count.toString()),
        Text("Previous: " + pagination.previous.toString()),
        Text("Next: " + pagination.next.toString()),
      ],
    );
  }



}