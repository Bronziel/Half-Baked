import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'EditClass.dart';
import 'EditRecipe.dart';

class EditImagePickerWidget extends StatefulWidget {
  final ValueChanged<List<XFile>?> onImagesPicked;
  final List<XFile>? initialImages;

  const EditImagePickerWidget({
    Key? key,
    required this.onImagesPicked,
    this.initialImages,
  }) : super(key: key);

  @override
  _EditImagePickerWidgetState createState() => _EditImagePickerWidgetState();
}

class _EditImagePickerWidgetState extends State<EditImagePickerWidget> {
  List<XFile>? _images;

  @override
  void initState() {
    super.initState();
    _images = widget.initialImages;
  }

  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    setState(() {
      _images = images;
    });

    widget.onImagesPicked(_images);
  }

  void _deleteImages() {
    setState(() {
      _images = null;
    });

    widget.onImagesPicked(_images);
  }

  void _discardSingleImage(int index) {
    setState(() {
      _images!.removeAt(index);
    });
    widget.onImagesPicked(_images);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF9896F1),
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Add New Images',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: _pickImages,
                child: const Text('Select Image'),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: _deleteImages,
                child: const Icon(Icons.delete),
              ),
            ],
          ),
          Container(
            height: 150, // adjust as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _images?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  width: 120, // adjust as needed
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.all(0),
                                  content: Stack(
                                    children: <Widget>[
                                      kIsWeb
                                          ? Image.network(_images![index].path)
                                          : Image.file(
                                              File(_images![index].path),
                                            ),
                                      Positioned(
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Align(
                                            alignment: Alignment.topRight,
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.close,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            child: kIsWeb
                                ? Image.network(_images![index].path,
                                    width: 100.0)
                                : Image.file(File(_images![index].path),
                                    width: 100.0),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _discardSingleImage(index),
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
