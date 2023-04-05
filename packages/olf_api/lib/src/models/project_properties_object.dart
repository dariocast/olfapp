import 'dart:convert';

import 'package:olf_api/src/models/models.dart';

class ProjectPropertiesObject {
  final PropertyRichText tempistiche;
  final PropertyRichText comeCandidarsi;
  final PropertyRichText richiestaDiLavoro;
  final PropertyRichText budget;
  final PropertySelect nda;
  final PropertyTitle codice;
  final PropertyRichText tempisticheDiPagamento;
  final PropertySelect tipoDiRelazione;
  final PropertyRichText descrizioneDelProgetto;
  ProjectPropertiesObject({
    required this.tempistiche,
    required this.comeCandidarsi,
    required this.richiestaDiLavoro,
    required this.budget,
    required this.nda,
    required this.codice,
    required this.tempisticheDiPagamento,
    required this.tipoDiRelazione,
    required this.descrizioneDelProgetto,
  });

  Map<String, dynamic> toMap() {
    return {
      'Tempistiche': tempistiche.toMap(),
      'Come candidarsi': comeCandidarsi.toMap(),
      'Richiesta di lavoro': richiestaDiLavoro.toMap(),
      'Budget': budget.toMap(),
      'NDA': nda.toMap(),
      'Codice': codice.toMap(),
      'Tempistiche di pagamento': tempisticheDiPagamento.toMap(),
      'Tipo di relazione': tipoDiRelazione.toMap(),
      'Descrizione del progetto': descrizioneDelProgetto.toMap(),
    };
  }

  factory ProjectPropertiesObject.fromMap(Map<String, dynamic> map) {
    return ProjectPropertiesObject(
      tempistiche: PropertyRichText.fromMap(
        map['Tempistiche'] as Map<String, dynamic>,
      ),
      comeCandidarsi: PropertyRichText.fromMap(
        map['Come candidarsi'] as Map<String, dynamic>,
      ),
      richiestaDiLavoro: PropertyRichText.fromMap(
        map['Richiesta di lavoro'] as Map<String, dynamic>,
      ),
      budget: PropertyRichText.fromMap(map['Budget'] as Map<String, dynamic>),
      nda: PropertySelect.fromMap(map['NDA'] as Map<String, dynamic>),
      codice: PropertyTitle.fromMap(map['Codice'] as Map<String, dynamic>),
      tempisticheDiPagamento: PropertyRichText.fromMap(
        map['Tempistiche di pagamento'] as Map<String, dynamic>,
      ),
      tipoDiRelazione: PropertySelect.fromMap(
        map['Tipo di relazione'] as Map<String, dynamic>,
      ),
      descrizioneDelProgetto: PropertyRichText.fromMap(
        map['Descrizione del progetto'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectPropertiesObject.fromJson(String source) =>
      ProjectPropertiesObject.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'ProjectPropertiesObject(tempistiche: $tempistiche, comeCandidarsi: $comeCandidarsi, richiestaDiLavoro: $richiestaDiLavoro, budget: $budget, nda: $nda, codice: $codice, tempisticheDiPagamento: $tempisticheDiPagamento, tipoDiRelazione: $tipoDiRelazione, descrizioneDelProgetto: $descrizioneDelProgetto)';
  }
}
