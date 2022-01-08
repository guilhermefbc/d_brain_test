import 'package:d_brain_test/src/modules/home/controllers/camera/my_camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ShowPhotoScreen extends StatefulWidget {
  const ShowPhotoScreen({Key? key}) : super(key: key);

  @override
  _ShowPhotoScreenState createState() => _ShowPhotoScreenState();
}

class _ShowPhotoScreenState extends State<ShowPhotoScreen> {
  final MyCameraController _myCameraController = Modular.get<MyCameraController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.file(_myCameraController.photo!, fit: BoxFit.cover,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            child: IconButton(
                              icon: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 30,
                              ),
                              onPressed: (){
                                Modular.to.pop(true);
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: (){
                                Modular.to.pop(false);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
          )
        ],
      )
    );
  }
}
