import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/src/configs/api.dart';
import 'package:mini_project/src/configs/app_route.dart';
import 'package:mini_project/src/pages/condo/condo_model.dart';
import 'package:mini_project/src/services/network.dart';

class AddRoomCondoPage extends StatefulWidget {
  @override
  _AddRoomCondoPageState createState() => _AddRoomCondoPageState();
}

class _AddRoomCondoPageState extends State<AddRoomCondoPage> {
  File _image;
  final picker = ImagePicker;

  final _formKey = GlobalKey<FormState>();
  bool _editMode;
  Condo condos;

  @override
  void initState() {
    _editMode = false;
    condos = Condo();
    super.initState();
  }

  callback(File image){
    _image = image;
  }

  @override
  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if(arguments is Condo){
      condos = arguments;
      _editMode = true;
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildIdInput(),
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                _buildNameInput(),
                SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildPriceInput(),
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                _buildLocationInput(),
                SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildPhoneInput(),
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                _buildLimitedroomInput(),
                SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildFacilitiesInput(),
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                _buildTypeInput(),
                SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildDetailInput(),
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                _buildImageInput(),
                ProductImage(callback, image: condos.condoimage),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputStyle({String label}) => InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.amberAccent,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black12,
      ),
    ),
    labelText: label,
  );

  TextFormField _buildIdInput() => TextFormField(
    enabled: !_editMode,
    initialValue: condos.condoId ?? "",
    decoration: inputStyle(label: "id"),
    keyboardType: TextInputType.number,
    onSaved: (String value) {
      condos.condoId = value;
    },
  );

  TextFormField _buildNameInput() => TextFormField(
    initialValue: condos.condoName ?? "",
    decoration: inputStyle(label: "name"),
    onSaved: (String value) {
      condos.condoName = value;
    },
  );

  TextFormField _buildPriceInput() => TextFormField(
    initialValue: condos.condoPrice ?? "",
    decoration: inputStyle(label: "price"),
    onSaved: (String value) {
      condos.condoPrice = value;
    },
  );

  TextFormField _buildLocationInput() => TextFormField(
    initialValue: condos.condoLocation ?? "",
    decoration: inputStyle(label: "location"),
    onSaved: (String value) {
      condos.condoLocation = value;
    },
  );

  TextFormField _buildPhoneInput() => TextFormField(
    initialValue: condos.condoPhone ?? "",
    decoration: inputStyle(label: "phone"),
    onSaved: (String value) {
      condos.condoPhone = value;
    },
  );

  TextFormField _buildLimitedroomInput() => TextFormField(
    initialValue: condos.condoLimitedroom ?? "",
    decoration: inputStyle(label: "limitedroom"),
    onSaved: (String value) {
      condos.condoLimitedroom = value;
    },
  );

  TextFormField _buildFacilitiesInput() => TextFormField(
    initialValue: condos.condoFacilities ?? "",
    decoration: inputStyle(label: "facilities"),
    onSaved: (String value) {
      condos.condoFacilities = value;
    },
  );

  TextFormField _buildTypeInput() => TextFormField(
    initialValue: condos.condoType ?? "",
    decoration: inputStyle(label: "type"),
    onSaved: (String value) {
      condos.condoType = value;
    },
  );

  TextFormField _buildDetailInput() => TextFormField(
    initialValue: condos.condoDetail ?? "",
    decoration: inputStyle(label: "detail"),
    onSaved: (String value) {
      condos.condoDetail = value;
    },
  );

  TextFormField _buildImageInput() => TextFormField(
    initialValue: condos.condoimage ?? "",
    decoration: inputStyle(label: "image"),
    onSaved: (String value) {
      condos.condoimage = value;
    },
  );

  AppBar _buildAppBar() => AppBar(
    centerTitle: false,
    title: Text(_editMode ? 'Edit condo' : 'Add Condo'),
    actions: [
      TextButton(
        onPressed: () async {
          _formKey.currentState.save();
          FocusScope.of(context).requestFocus(FocusNode());
          if (_editMode) {//edit game
            try{
              final message = await NetworkService().editCondoDio(_image, condos);
              if (message == 'Edit Successfully') {
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.condoRoutr, (route) => false);
              }else{
                Flushbar(
                  title:  "Edit",
                  titleColor: Colors.red,
                  backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.greenAccent]),
                  icon: Icon(
                    Icons.cancel_presentation, size: 35,
                    color: Colors.amber,
                  ),
                  message:  "Edit Successfully",
                  duration:  Duration(seconds: 5),
                )..show(context);

              }
            }catch(ex){
              Flushbar(
                title:  "Edit Fild",
                titleColor: Colors.red,
                backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.greenAccent]),
                icon: Icon(
                  Icons.cancel_presentation, size: 35,
                  color: Colors.amber,
                ),
                message:  "Edit Successfully",
                duration:  Duration(seconds: 5),
              )..show(context);

            }
          }else{//add game
            try {
              Navigator.pop(context);
              final message = await NetworkService().addCondoDio(_image, condos);
              if (message == 'Add Successfully') {
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.condoRoutr, (route) => false);
              } else {
                Flushbar(
                  title:  "Add Fild",
                  titleColor: Colors.red,
                  backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.greenAccent]),
                  icon: Icon(
                    Icons.cancel_presentation, size: 35,
                    color: Colors.amber,
                  ),
                  message:  "add Successfully",
                  duration:  Duration(seconds: 5),
                )..show(context);
              }
            }catch(ex){
              Flushbar(
                title:  "Add Fild",
                titleColor: Colors.red,
                backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.greenAccent]),
                icon: Icon(
                  Icons.cancel_presentation, size: 35,
                  color: Colors.amber,
                ),
                message:  "add Successfully",
                duration:  Duration(seconds: 5),
              )..show(context);
            }
          }
        },
        child: Text('submit',style: TextStyle(color: Colors.white70),),
      )
    ],
  );
} //end class
class ProductImage extends StatefulWidget {
  final Function callBack;
  final String image;

  const ProductImage(this.callBack, {Key key, @required this.image})
      : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  File _imageFile;
  String _image;
  final _picker = ImagePicker();

  @override
  void initState() {
    _image = widget.image;
    super.initState();
  }

  @override
  void dispose() {
    _imageFile?.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildPickerImage(),
          _buildPreviewImage(),
        ],
      ),
    );
  }

  dynamic _buildPreviewImage() {
    if ((_image == null || _image.isEmpty) && _imageFile == null) {
      return SizedBox();
    }

    final container = (Widget child) => Container(
      color: Colors.grey[100],
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.center,
      height: 350,
      child: child,
    );

    return _image != null
        ? container(Image.network('${API.CONDO_IMAGE}/$_image'))
        : Stack(
      children: [
        container(Image.file(_imageFile)),
        _buildDeleteImageButton(),
      ],
    );
  }

  OutlinedButton _buildPickerImage() => OutlinedButton.icon(
    icon: Icon(Icons.image),
    label: Text('image'),
    onPressed: () {
      _modalPickerImage();
    },
  );

  void _modalPickerImage() {
    final buildListTile =
        (IconData icon, String title, ImageSource source) => ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop();
        _pickImage(source);
      },
    );

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildListTile(
                Icons.photo_camera,
                "Take a picture from camera",
                ImageSource.camera,
              ),
              buildListTile(
                Icons.photo_library,
                "Choose from photo library",
                ImageSource.gallery,
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickImage(ImageSource source) {
    _picker
        .getImage(
      source: source,
      imageQuality: 70,
      maxHeight: 500,
      maxWidth: 500,
    )
        .then((file) {
      if (file != null) {
        setState(() {
          _imageFile = File(file.path);
          _image = null;
          widget.callBack(_imageFile);
        });
      }
    }).catchError((error) {
      //todo
    });
  }


  Positioned _buildDeleteImageButton() => Positioned(
    right: 0,
    child: IconButton(
      onPressed: () {
        setState(() {
          _imageFile = null;
          widget.callBack(null);
        });
      },
      icon: Icon(
        Icons.clear,
        color: Colors.black54,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
  );
}
