library src.registry.impl;

import 'package:mysshop/util_rsa/asymmetric/rsa.dart';
import 'package:mysshop/util_rsa/key_generators/rsa_key_generator.dart';
import 'package:mysshop/util_rsa/src/registry/registry.dart';

void registerFactories(FactoryRegistry registry) {
  _registerAsymmetricCiphers(registry);
  _registerKeyGenerators(registry);
  _registerPaddings(registry);
}

void _registerAsymmetricCiphers(FactoryRegistry registry) {
  registry.register(RSAEngine.factoryConfig);
}

void _registerKeyGenerators(FactoryRegistry registry) {
  registry.register(RSAKeyGenerator.factoryConfig);
}

void _registerPaddings(FactoryRegistry registry) {}
