import 'call.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _channelController = TextEditingController();
  bool _validateError = false;
  ClientRole? _role = ClientRole.Broadcaster;
  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Video Call',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/VideoCall.webp'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Divider(
                thickness: 5,
                height: 20,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _channelController,
                decoration: InputDecoration(
                  errorText:
                      _validateError ? 'Channel name is mandatory' : null,
                  border: UnderlineInputBorder(
                    borderSide: const BorderSide(width: 1),
                  ),
                  hintText: 'Channel Name',
                ),
              ),
              RadioListTile(
                title: const Text('Broadcaster'),
                onChanged: (ClientRole? value) {
                  setState(() {
                    _role = value;
                  });
                },
                value: ClientRole.Broadcaster,
                groupValue: _role,
              ),
              RadioListTile(
                title: const Text('Audience'),
                onChanged: (ClientRole? value) {
                  setState(() {
                    _role = value;
                  });
                },
                value: ClientRole.Audience,
                groupValue: _role,
              ),
              ElevatedButton(
                onPressed: onJoin,
                child: const Text('Join'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallPage(
              channelName: _channelController.text,
              role: _role,
            ),
          ));
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }
}
