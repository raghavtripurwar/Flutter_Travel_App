import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:geolocator/geolocator.dart';

class Map_Page extends StatefulWidget {
  @override
  List<int> list=[];
  Map_Page(this.list);
  Map_PageState createState() => Map_PageState(list);
}

class Map_PageState extends State<Map_Page> {
  List<int> list=[];
  Map_PageState(this.list);
 Completer<GoogleMapController> _controller = Completer();
 GoogleMapController _mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<Marker> allmarkers=[];
  var client=[];
  var currentLocation;
  LatLng _center;

  @override
  void initState() {
    super.initState();
    populateClients(list);
    getUserLocation();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }),
        title: Text("AURANGABAD"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:<Widget>[
                SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/ajanta-caves-22506994.jpg",
                  20.5519,75.7033, "AJANTA"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/bibi-ka-maqbara-aurangabad-india-bibi-ka-maqbara-located-aurangabad-india-106770228.jpg",
                  19.9015, 75.3202, "Bibi-ka-Maqbura"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/daulatabad-fort-minaret-india-33380210.jpg",
                  19.9427,75.2132, "DAULATABAD"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/india-ellora-caves-15999531.jpg",20.0258
                  ,75.178, "ELLORA"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/grishneshwar-jyotirlinga-temple-near-ellora-maharashtra-state-india-50522243.jpg",
                  20.0253,75.1606, "GHRISHNESHWAR"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/must-visit-site-gautala-sanctuary-hill-station-aurangabad-maharashtra-india-amazing-view-mountain-152768148.jpg",20.338017
                  , 75.147715, "Gautala Autramghat Sanctuary "),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/nath-sagar-jalasha-reservoir-formed-jayakwadi-dam-paithan-aurangabad-maharashtra-nath-sagar-jalasha-reservoir-formed-154871725.jpg",
                  19.4777,75.3849, "PAITHAN"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/d-panchakki-also-known-as-water-mill-takes-its-name-which-used-to-grind-grain-pilgrims-aurangab-aurangabad-168781768.jpg",
                  19.8891,75.3154, "PANCHAKKI"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://thumbs.dreamstime.com/z/greenery-stairs-to-temple-beautiful-green-hindu-god-datta-maharaj-located-lush-green-forest-sulibhanjan-attracts-98225808.jpg",
                  19.9807,75.1837, "SULIBHANJAN"),
            ),


          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String place) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(place),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String place) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(place,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Container(
                    child: Text(
                      "(946)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),


        SizedBox(height:5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }



  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

  populateClients(List<int> list) {

    Firestore.instance.collection('places').getDocuments().then((docs)
    {
      if(docs.documents.isNotEmpty) {
        for(int i = 0; i <list.length; i++) {
          //clients.add(docs.documents[i].data);
          initMarker(docs.documents[list[i]].data,
              docs.documents[list[i]].documentID);
        }
      }
    });
  }
  void initMarker(client, markerRef) {
    var markerIDVal = markerRef;
    final MarkerId markerId = MarkerId(markerIDVal);

    //new marker

    final Marker marker = Marker(
      position: LatLng(client['latitude'],
          client['longitude']),
      markerId: markerId,
      infoWindow: InfoWindow(title: markerRef),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }


  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print('center $_center');
  }


  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
        CameraPosition(target:_center
            , zoom: 17),

        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(markers.values),


      ),
    );
  }
  void _onMapCreated(GoogleMapController controller) {

    setState(() {
      _controller.complete(controller);

    });
  }



}