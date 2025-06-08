import 'package:dark/components/CustomButton.dart';
import 'package:dark/components/TextFormField.dart';
import 'package:dark/darkMode_cubit/darkCubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Edit_Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: NewsCubit.get(context).isDark
                ? const Color(0xFFEEEEEE)
                : const Color(0xFF115173),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: NewsCubit.get(context).isDark
                ? const Color(0xFFEEEEEE)
                : const Color(0xFF115173),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/app-icon.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Change Profile Photo',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.camera_alt,
                                                size: 30),
                                            onPressed: () {
                                              print("Camera tapped");
                                              _openCamera(context);
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Camera',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.photo, size: 30),
                                            onPressed: () {
                                              print("Gallery tapped");
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Gallery',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.delete,
                                                size: 30, color: Colors.red),
                                            onPressed: () {
                                              print("Remove image tapped");
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Remove',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Textformfield(
                HintText: 'Email Address',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              Textformfield(
                HintText: 'First Name',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 15),
              Textformfield(
                HintText: 'Last Name',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 15),
              Textformfield(
                HintText: 'Phone number',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              Textformfield(
                HintText: 'Password',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 35),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: NewsCubit.get(context).isDark
                      ? const Color(0xFFFCC876)
                      : const Color(0xFF115173),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 50,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
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

  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera(BuildContext context) async {
    // التحقق من صلاحيات الوصول للكاميرا
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      // إذا كانت الصلاحيات مُعطاة، قم بفتح الكاميرا
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

      if (photo != null) {
        // هنا يمكنك العمل مع الصورة الملتقطة
        print("Image Path: ${photo.path}");
        // يمكنك عرض الصورة باستخدام Image.file(photo)
        Navigator.pop(context); // إغلاق الـ BottomSheet بعد التقاط الصورة
      } else {
        print("No image selected.");
      }
    } else {
      // إذا كانت الصلاحيات مرفوضة، اطبع رسالة أو اعرض تنبيه للمستخدم
      print("Camera permission denied");
      // يمكنك هنا عرض تنبيه للمستخدم أو توجيههم لتمكين الصلاحيات
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Camera permission is required to take a photo')),
      );
    }
  }
}
