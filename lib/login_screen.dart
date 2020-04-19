import 'package:flutter/material.dart';
import 'package:ui_practices/utilities/constants.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _rememberMe = false; 
  Widget _buildEmailTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style:kLabelStyle,
        ),
        SizedBox(height: 10.0,),
        Container(
          alignment: Alignment.centerLeft,
          decoration:kBoxDecorationStyle,
          height:60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style:TextStyle(
              color:Colors.white,
              fontFamily:'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your e-mail:',
              hintStyle: kHintTextStyle
            )
          ),
        )
      ],
    );
  }

 Widget _buildPasswordTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style:kLabelStyle,
        ),
        SizedBox(height: 10.0,),
        Container(
          alignment: Alignment.centerLeft,
          decoration:kBoxDecorationStyle,
          height:60.0,
          child: TextField(
            obscureText: true,
            style:TextStyle(
              color:Colors.white,
              fontFamily:'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your password:',
              hintStyle: kHintTextStyle
            )
          ),
        )
      ],
    );
  }
  Widget _buildForgetPasswordBtn(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot button pressed'), 
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forget password?',
          style:kLabelStyle,
        )),
    );
  }

   Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn(){
    return Container(
      padding:EdgeInsets.symmetric(vertical: 25.0),
      width:double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button pressed'),
        padding:EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(30.0),
        ),
        color:Colors.white,
        child: Text(
          'Login',
          style:TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing:1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily:'OpenSans'
          ),
        )
      )
    );
  }

  Widget _buildSignIn(){
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height:20.0),
      Text(
        'Sign in with', 
        style:kLabelStyle
        )
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap,AssetImage image){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:60.0,
        width:60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,2),
              blurRadius: 6.0,
            )
          ],
          image:DecorationImage(image: image)
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpBtn(){
    return GestureDetector(
      onTap: () => print('Sign up button pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Dont have an account?',
              style:TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              )
            ),
            TextSpan(
              text:'Sign Up',
              style:TextStyle(
                color: Colors.white,
                fontSize:18.0,
                fontWeight:FontWeight.bold,
              )
            )
          ]
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration:BoxDecoration(
                  gradient: LinearGradient(
                    begin:Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff302b63),
                      Color(0xff302b63),
                      Color(0xff24243e),
                      Color(0xff24243e),
                    ],
                    stops:[0.1,0.4,0.7,0.9],
                  )
                )
              ),
              Container(
                height:double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical:120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily:'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height:30.0),
                      _buildEmailTF(),
                      SizedBox(height:30.0),
                      _buildPasswordTF(),
                      _buildForgetPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignIn(),
                      _buildSocialBtnRow(),
                      _buildSignUpBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}