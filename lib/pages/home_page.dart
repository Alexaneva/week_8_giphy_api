import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GiphyGif? _gif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black12,
          centerTitle: true,
          title: Text(
            _gif?.title ?? 'Giphy',
            style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          )),
      body: Container(
        padding: const EdgeInsets.only(left: 60),
        child: Center(
          child: Row(
            children: [
              _gif == null
                  ? const Text(
                      'Click for founding a gif',
                      style:
                          TextStyle(fontSize: 22, fontStyle: FontStyle.normal),
                    )
                  : GiphyImage.original(gif: _gif!),
              SizedBox(width: 10),
              FloatingActionButton(
                backgroundColor: Colors.black12,
                  child: const Icon(Icons.search_sharp),
                  onPressed: () async {
                    var gif = await GiphyPicker.pickGif(
                      context: context,
                      fullScreenDialog: false,
                      showPreviewPage: true,
                      apiKey: '3lbiEXwypYKX0ZmgxSSlVCsNb9RvLgC4',
                    );
                    if (gif == null) {
                      setState(() {
                        gif = gif;
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
