import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'dart:async';
import 'dart:developer' as developer;

import '../../../colors/colors.dart';

class DeviceIp extends StatefulWidget {
  const DeviceIp({Key? key}) : super(key: key);

  @override
  State<DeviceIp> createState() => _DeviceIpState();
}

class _DeviceIpState extends State<DeviceIp> {
  String _getNomeRede = 'Aguardando...';
  String _getIPv4 = 'Aguardando...';
  String _getIPv6 = 'Aguardando...';
  String _getIpGateway = 'Aguardando...';
  String _getBroadcast = 'Aguardando...';

  final NetworkInfo _networkInfo = NetworkInfo();

  @override
  void initState() {
    super.initState();
    _initNetworkInfo();
  }

  Future<void> _initNetworkInfo() async {
    String? nomeRede, ipv4, ipv6, broadcast, ipGateway;

    try {
      nomeRede = await _networkInfo.getWifiName();
    } on PlatformException catch (e) {
      developer.log('Falha ao obter nome da rede', error: e);
      nomeRede = 'Falha ao obter nome da rede';
    }

    try {
      ipv4 = await _networkInfo.getWifiIP();
    } on PlatformException catch (e) {
      developer.log('Falha ao obter o IPv4', error: e);
      ipv4 = 'Falha ao obter o IPv4';
    }

    try {
      ipv6 = await _networkInfo.getWifiIPv6();
    } on PlatformException catch (e) {
      developer.log('Falha ao obter o IPv6', error: e);
      ipv6 = 'Falha ao obter o IPv6';
    }

    try {
      ipGateway = await _networkInfo.getWifiGatewayIP();
    } on PlatformException catch (e) {
      developer.log('Falha ao obter o gateway padrão', error: e);
      ipGateway = 'Falha ao obter o gateway padrão';
    }

    try {
      broadcast = await _networkInfo.getWifiBroadcast();
    } on PlatformException catch (e) {
      developer.log('Falha ao obter o BSSID', error: e);
      broadcast = 'Falha ao obter o BSSID';
    }

    setState(() {
      _getNomeRede = '$nomeRede';
      _getIPv4 = '$ipv4';
      _getIPv6 = '$ipv6';
      _getIpGateway = '$ipGateway';
      _getBroadcast = '$broadcast';
    });
  }

  @override
  Widget build(BuildContext context) {
    const textVerde = TextStyle(
      color: verdeNeon,
      fontSize: 18,
      fontFamily: 'CourierNew',
      letterSpacing: 1.0,
      fontWeight: FontWeight.w700,
    );
    return Center(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: preto,
          appBar: AppBar(
            //elevation: 10,
            backgroundColor: azulNeon,
            centerTitle: true,
            title: const Text(
              'NETWORK INFO',
              maxLines: 2,
              style: TextStyle(
                //backgroundColor: verdeMuitoEscuro,
                color: preto,
                fontSize: 23,
                fontFamily: 'CourierNew',
                letterSpacing: 1.75,
                fontWeight: FontWeight.w700,
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          body: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Divider(color: transparente, height: 5),
                          Text(
                            'Rede:$_getNomeRede',
                            style: textVerde,
                          ),
                          const Divider(color: transparente, height: 5),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Divider(color: transparente, height: 5),
                          Text(
                            'IPv4:$_getIPv4',
                            style: textVerde,
                          ),
                          const Divider(color: transparente, height: 5),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Divider(color: transparente, height: 5),
                          Text(
                            'IPv6:\n$_getIPv6',
                            style: textVerde,
                          ),
                          const Divider(color: transparente, height: 5),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Divider(color: transparente, height: 5),
                          Text(
                            'Gateway padrão:$_getIpGateway',
                            style: textVerde,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Divider(color: transparente, height: 5),
                          Text(
                            'Broadcast:$_getBroadcast',
                            style: textVerde,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
