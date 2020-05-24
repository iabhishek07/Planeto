import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planeto/constants.dart';
import 'package:planeto/swiper_data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;
  const DetailPage({Key key, this.planetInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 300),
                        Text(
                          planetInfo.name,
                          style: GoogleFonts.poppins(
                            fontSize: 56.0,
                            fontWeight: FontWeight.w900,
                            color: primaryTextColor,
                          ),
                        ),
                        Text(
                          'Solar System',
                          style: GoogleFonts.poppins(
                            fontSize: 31.0,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32.0),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              color: contentTextColor),
                        ),
                        SizedBox(height: 32.0),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 250.0,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                      itemCount: planetInfo.images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              planetInfo.images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: -64,
              child: Hero(
                tag: planetInfo.position,
                child: Image.asset(planetInfo.iconImage),
              ),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                planetInfo.position.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
