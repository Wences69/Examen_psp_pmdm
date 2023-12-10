import 'dart:io';
import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../CustomViews/CustomButton.dart';

class ProfileImageChangeView extends StatefulWidget {
  ProfileImageChangeView({Key? key}) : super(key: key);

  @override
  State<ProfileImageChangeView> createState() =>
      _ProfileImageChangeViewState();
}

class _ProfileImageChangeViewState extends State<ProfileImageChangeView> {
  File _imagePreview = File("");
  String fotoPerfilUrl = "";

  @override
  void initState() {
    super.initState();
    fotoPerfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personaliza tu avatar",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              _buildProfileImage(context),

              const SizedBox(height: 25),

              CustomButton(
                sText: "Abrir galería o cámara",
                onTap: () => _showImagePicker(context),
              ),

              const SizedBox(height: 25),

              CustomButton(
                sText: "Cambiar foto perfil",
                onTap: () {
                  DataHolder().fbadmin.editarFotoPerfil(_imagePreview);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    if (_imagePreview != null && _imagePreview.path.isNotEmpty) {
      return Image.file(_imagePreview);
    } else if (fotoPerfilUrl.isNotEmpty) {
      return Image.network(fotoPerfilUrl);
    } else {
      return Icon(
        Icons.person,
        size: 100,
        color: Theme.of(context).colorScheme.onBackground,
      );
    }
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext builder) {
        return Container(
          padding: EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text(
                  "Seleccionar de la galería",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              Divider(color: Theme.of(context).colorScheme.inversePrimary),
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text(
                  "Tomar foto",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickImage(ImageSource source) async {
    final XFile? fotoSacadaDelMovil =
    await ImagePicker().pickImage(source: source);

    if (fotoSacadaDelMovil != null) {
      setState(() {
        _imagePreview = File(fotoSacadaDelMovil!.path);
      });
    }
  }

  Future<void> fotoPerfil() async {
    fotoPerfilUrl = await DataHolder().fbadmin.getLinkAvatar();
    setState(() {});
  }
}
