import 'package:flutter/material.dart';
import 'package:fmaps_route/models/location_model.dart';
import 'package:fmaps_route/pages/detail_locatian_page.dart';
import 'package:fmaps_route/pages/detail_route_page.dart';

class LocationCardTile extends StatelessWidget {
  final LocationModel location;

  LocationCardTile({
    Key key,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              location.galleries[0].url,
              height: 110,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 7),
                Text(
                  location.address,
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  'Buka ${location.openTime} WITA',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailRoutePage(
                              location: location,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Rute',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailLocationPage(
                              location: location,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Detail Lokasi',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black45,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
