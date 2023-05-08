import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../widgets/stylish_app_bar.dart';

class LiveMainPage extends StatefulWidget {
  const LiveMainPage({super.key});

  @override
  State<LiveMainPage> createState() => _LiveMainPageState();
}

class _LiveMainPageState extends State<LiveMainPage> {
  // 視訊
  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();

  // ICE
  final _localCandidates = <RTCIceCandidate>[];
  final _remoteCandidates = <RTCIceCandidate>[];

  // 當 ICE 已經完成時通知。
  final _localCandidatesComplete = Completer<List<RTCIceCandidate>>();
  final _remoteCandidatesComplete = Completer<List<RTCIceCandidate>>();

  // _peerConnection是RTCPeerConnection實例，用於建立P2P連接並處理視頻和音頻數據的傳輸。
  RTCPeerConnection? _peerConnection;

  // _localStream是MediaStream實例，代表本地流，包含本地的音頻和視頻數據。
  MediaStream? _localStream;

  // _timer是Timer實例，用於定期更新本地和遠程視頻的狀態。
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initRenderers();
    WidgetsFlutterBinding.ensureInitialized();
    if (WebRTC.platformIsDesktop) {
      debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
    } else if (WebRTC.platformIsAndroid) {
      startForegroundService();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _disposeRenderers();
    _peerConnection?.close();
    _localStream?.dispose();
    super.dispose();
  }

  Future<bool> startForegroundService() async {
    const androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: 'Title of the notification',
      notificationText: 'Text of the notification',
      notificationImportance: AndroidNotificationImportance.Default,
      notificationIcon: AndroidResource(
          name: 'background_icon',
          defType: 'drawable'), // Default is ic_launcher from folder mipmap
    );
    await FlutterBackground.initialize(androidConfig: androidConfig);
    return FlutterBackground.enableBackgroundExecution();
  }

  Future<void> _initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  void _disposeRenderers() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
  }

  // _createOffer是創建本地Offer的方法，使用_peerConnection的createOffer方法和setLocalDescription方法創建和設置本地描述。
  Future<void> _createOffer() async {
    try {
      final offer = await _peerConnection!.createOffer();
      await _peerConnection!.setLocalDescription(offer);
      _sendLocalDescription(offer);
    } catch (e) {
      print('Failed to create offer: ${e.toString()}');
    }
  }

  // _createAnswer是創建本地Answer的方法，使用_peerConnection的createAnswer方法和setLocalDescription方法創建和設置本地描述。
  Future<void> _createAnswer() async {
    try {
      final answer = await _peerConnection!.createAnswer();
      await _peerConnection!.setLocalDescription(answer);
      _sendLocalDescription(answer);
    } catch (e) {
      print('Failed to create answer: ${e.toString()}');
    }
  }

  // _sendLocalDescription是發送本地描述的方法，你需要使用一種信令機制（例如WebSocket、Firebase或其他API）將描述發送給遠程對等方。
  void _sendLocalDescription(RTCSessionDescription description) {
    // You need to send the description to the remote peer using a signaling mechanism
    // such as WebSocket, Firebase, or any other API.
  }

  // _addCandidate是將ICE候選添加到列表的方法，你需要使用一種信令機制（例如WebSocket、Firebase或其他API）將候選人發送給遠程對等方。
  void _addCandidate(RTCIceCandidate candidate) {
    // You need to send the candidate to the remote peer using a signaling mechanism
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const StylishAppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  child: RTCVideoView(_remoteRenderer),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  child: RTCVideoView(_localRenderer),
                ),
              )
            ],
          ),
        ));
  }
}
