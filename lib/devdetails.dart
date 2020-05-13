import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';
class devdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserProfilePage();

  }
}

class UserProfilePage extends StatelessWidget {
  final String _fullName = "Clement Adriean A A";
  final String _status = "Software Developer";
  final String _bio =
      "\"Hi, I am a Mobile App developer and a Data Science enthusiast. If you wants to contact me to build your product leave a message.\"";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('static/cover.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('static/clem.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }


  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Get in Touch with ${_fullName.split(" ")[0]},",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              child:  Center(
                  child: IconButton(
                    icon: (Icon(AntDesign.github)),
                    onPressed: _launchgit,
                    iconSize: 50,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              child: Container(

                child: Center(
                    child:IconButton(
                      icon: (Icon(AntDesign.linkedin_square)),
                      onPressed: _launchlinkedin,
                      iconSize: 50,

                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              child: Container(

                child: Center(
                  child:IconButton(
                    icon: (Icon(AntDesign.instagram)),
                    onPressed: _launchinsta,
                    iconSize: 50,

                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              child: Container(

                child: Center(
                  child:IconButton(
                    icon: (Icon(Entypo.mail)),
                    onPressed: _launchMailClient,
                    iconSize: 50,

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffff6101),
    title: Text('Covid-19'),),
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
           SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(),
                  _buildFullName(),
                  _buildStatus(context),
                  _buildBio(context),
                  _buildSeparator(screenSize),
                  SizedBox(height: 10.0),
                  _buildGetInTouch(context),
                  SizedBox(height: 8.0),
                  _buildButtons(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}

_launchgit() async {
  const url = 'https://github.com/ACAA06';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchlinkedin() async {
  const url = 'https://www.linkedin.com/in/clement-adriean-5a3498167?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BqwdadW%2BQQ5%2BbRBVB1a2xug%3D%3D';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchinsta() async {
  const url = 'https://instagram.com/this_is_cadr_06?igshid=1eqjp086kyfnf';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchMailClient() async {
  const mailUrl = 'mailto:clementjoe99@gmail.com';
  try {
    await launch(mailUrl);
  } catch (e) {
    print(e);
  }
}