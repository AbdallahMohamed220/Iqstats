import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iqstats/constant.dart';
import 'package:iqstats/screens/login/components/custome_text_feild.dart';
import 'package:iqstats/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  var loadingKit = Center(
    child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SpinKitSquareCircle(
          color: Colors.black,
          size: 50.0,
        ),
      ],
    ),
  );

  _submitForm() {
    // if (!_formKey.currentState.validate()) {
    //   return;
    // }

    return buildSearchBottomSheet();
  }

  Future buildSearchBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 20,
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: AppColor.kSecondaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  right: 30,
                  left: 30,
                ),
                child: TextFormField(
                  controller: userNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter vaild Value';
                    }
                    if (value.length <= 2) {
                      return 'Enter vaild Value';
                    }
                    return "";
                  },
                  decoration: InputDecoration(
                    suffix: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: AppColor.kSecondaryColor,
                      ),
                      onPressed: () {},
                    ),
                    hintText: 'keword',
                    focusedBorder: UnderlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/player.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5.0,
                                bottom: 5,
                              ),
                              child: Text('Mo Salah'),
                            ),
                            Text('Player'),
                          ],
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColor.kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Center(child: Image.asset('assets/images/logo.png')),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColor.kSecondaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        top: 15,
                      ),
                      child: CustomeTextField(
                        controller: userNameController,
                        validator: Validator.notEmpty,
                        hintTxt: "Username",
                        labelTxt: "Username",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                      ),
                      child: CustomeTextField(
                        controller: passwordController,
                        validator: Validator.notEmpty,
                        hintTxt: "password",
                        labelTxt: "password",
                        obscureTextbool: true,
                      ),
                    ),
                    isLoading
                        ? loadingKit
                        : Padding(
                            padding: const EdgeInsets.only(
                              left: 50.0,
                              top: 20,
                            ),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () => _submitForm(),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.kPrimaryColor,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: AppColor.kMainColor,
                                  minimumSize: Size(
                                    410,
                                    40,
                                  ),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: const SizedBox(),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/login_player.png',
                      height: 400,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'boost your team with IQstats',
                        style: TextStyle(
                          color: AppColor.kSecondaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        'we collect a lot of data to help your improve your team',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
