import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../recipeLayout.dart';
import '../../../visualview/appbar/customappbar.dart';

class RecipeDetailsPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsPage({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void _showImageDialog(String imagePath) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Stack(
              children: <Widget>[
                Image.network(imagePath),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Half Baked', color: Color.fromARGB(255, 97, 89, 100)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                itemCount: widget.recipe.imageUrls.length,
                itemBuilder: (context, index, realIdx) {
                  return GestureDetector(
                    onTap: () =>
                        _showImageDialog(widget.recipe.imageUrls[index]),
                    child: Image.network(widget.recipe.imageUrls[index]),
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.recipe.imageUrls.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _current == entry.key
                              ? Colors.purple
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: Image.network(entry.value, fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
              Card(
                color: Color(0xFF9896F1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Portions'),
                          Text('${widget.recipe.portionSize}'),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Prep Time'),
                          Text('${widget.recipe.prepTime} minutes'),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Total Time'),
                          Text('${widget.recipe.totalTime} minutes'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.recipe.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.recipe.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Equipment:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final equipmentItem in widget.recipe.equipment)
                Text(equipmentItem),
              const SizedBox(height: 16),
              const Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final ingredient in widget.recipe.ingredients)
                Text(
                  '${ingredient['name']} - ${ingredient['amount']}${ingredient['unit']}',
                ),
              const SizedBox(height: 16),
              const Text(
                'Steps:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final step in widget.recipe.steps) Text(step),
            ],
          ),
        ),
      ),
    );
  }
}
