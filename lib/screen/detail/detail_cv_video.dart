import 'package:app_interview/constants/constants_style.dart';
import 'package:app_interview/constants/screen_default.dart';
import 'package:app_interview/screen/detail/widget_detail/section_title.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import 'package:chewie/chewie.dart';

class DetailCvVideoScreen extends StatefulWidget {
  final bool isCv;
  final dynamic arrayData;
  const DetailCvVideoScreen(
      {Key? key, required this.isCv, required this.arrayData})
      : super(key: key);

  @override
  State<DetailCvVideoScreen> createState() => _DetailCvVideoScreenState();
}

class _DetailCvVideoScreenState extends State<DetailCvVideoScreen> {
  late VideoPlayerController _controller;
  late PdfController _pdfController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset("assets/video/video_demo.mp4");
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
    );
    _controller.initialize();
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/pdf/cv.pdf'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (
                  context,
                ) =>
                        const HomeScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(widget.isCv ? "View CV " : "View Video"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle("Company Name:"),
              Text(
                widget.arrayData["name_company"].toString(),
                style: const TextStyle(fontSize: textSizeBody1),
              ),
              const SizedBox(
                height: 20,
              ),
              sectionTitle("Full Name:"),
              Text(
                widget.arrayData["name_user"].toString(),
                style: const TextStyle(fontSize: textSizeBody1),
              ),
              const SizedBox(
                height: 8,
              ),
              if (widget.isCv == false) viewVideoPlayer(),
              if (widget.isCv == true)
                SizedBox(
                  height: 480,
                  child: PdfView(
                    controller: _pdfController,
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column viewVideoPlayer() {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(
            controller: _chewieController,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
