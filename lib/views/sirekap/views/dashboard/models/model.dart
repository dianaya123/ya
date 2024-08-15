import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart'; // Ini akan dihasilkan oleh package build_runner

@JsonSerializable()
class JumlahModel {
  final int jumlah;

  JumlahModel({required this.jumlah});

  // Method untuk membuat JumlahModel dari JSON
  factory JumlahModel.fromJson(Map<String, dynamic> json) =>
      _$JumlahModelFromJson(json);

  // Method untuk mengubah JumlahModel ke JSON
  Map<String, dynamic> toJson() => _$JumlahModelToJson(this);
}