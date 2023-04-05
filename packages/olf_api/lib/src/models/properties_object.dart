import 'dart:convert';

import 'package:olf_api/src/models/models.dart';

class PropertiesObject {
  final PropertyRichText jobPosted;
  final PropertySelect team;
  final PropertySelect contratto;
  final PropertySelect seniority;
  final PropertySelect ral;
  final PropertyTitle name;
  final PropertyRichText qualifica;
  final PropertyRichText retribuzione;
  final PropertyRichText descrizioneOfferta;
  final PropertyRichText comeCandidarsi;
  final PropertyRichText localita;
  final PropertyRichText nomeAzienda;
  final PropertyRichText statoDiPubblicazione;
  final PropertyUrl urlSitoWeb;
  PropertiesObject({
    required this.jobPosted,
    required this.team,
    required this.contratto,
    required this.seniority,
    required this.ral,
    required this.name,
    required this.qualifica,
    required this.retribuzione,
    required this.descrizioneOfferta,
    required this.comeCandidarsi,
    required this.localita,
    required this.nomeAzienda,
    required this.statoDiPubblicazione,
    required this.urlSitoWeb,
  });

  Map<String, dynamic> toMap() {
    return {
      'Job Posted': jobPosted.toMap(),
      'Team': team.toMap(),
      'Contratto': contratto.toMap(),
      'Seniority': seniority.toMap(),
      'RAL': ral.toMap(),
      'Name': name.toMap(),
      'Qualifica': qualifica.toMap(),
      'Retribuzione': retribuzione.toMap(),
      'Descrizione offerta': descrizioneOfferta.toMap(),
      'Come candidarsi': comeCandidarsi.toMap(),
      'Località': localita.toMap(),
      'Nome azienda': nomeAzienda.toMap(),
      'Stato di pubblicazione': statoDiPubblicazione.toMap(),
      'URL sito web': urlSitoWeb.toMap(),
    };
  }

  factory PropertiesObject.fromMap(Map<String, dynamic> map) {
    return PropertiesObject(
      jobPosted:
          PropertyRichText.fromMap(map['Job Posted'] as Map<String, dynamic>),
      team: PropertySelect.fromMap(map['Team'] as Map<String, dynamic>),
      contratto:
          PropertySelect.fromMap(map['Contratto'] as Map<String, dynamic>),
      seniority:
          PropertySelect.fromMap(map['Seniority'] as Map<String, dynamic>),
      ral: PropertySelect.fromMap(map['RAL'] as Map<String, dynamic>),
      name: PropertyTitle.fromMap(map['Name'] as Map<String, dynamic>),
      qualifica:
          PropertyRichText.fromMap(map['Qualifica'] as Map<String, dynamic>),
      retribuzione:
          PropertyRichText.fromMap(map['Retribuzione'] as Map<String, dynamic>),
      descrizioneOfferta: PropertyRichText.fromMap(
        map['Descrizione offerta'] as Map<String, dynamic>,
      ),
      comeCandidarsi: PropertyRichText.fromMap(
        map['Come candidarsi'] as Map<String, dynamic>,
      ),
      localita:
          PropertyRichText.fromMap(map['Località'] as Map<String, dynamic>),
      nomeAzienda:
          PropertyRichText.fromMap(map['Nome azienda'] as Map<String, dynamic>),
      statoDiPubblicazione: PropertyRichText.fromMap(
        map['Stato di pubblicazione'] as Map<String, dynamic>,
      ),
      urlSitoWeb:
          PropertyUrl.fromMap(map['URL sito web'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertiesObject.fromJson(String source) =>
      PropertiesObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PropertiesObject(jobPosted: $jobPosted, team: $team'
        ', contratto: $contratto, seniority: $seniority, ral: $ral, name: $name'
        ', qualifica: $qualifica, retribuzione: $retribuzione'
        ', descrizioneOfferta: $descrizioneOfferta'
        ', comeCandidarsi: $comeCandidarsi, localita: $localita'
        ', nomeAzienda: $nomeAzienda, statoDiPubblicazione:'
        ' $statoDiPubblicazione, urlSitoWeb: $urlSitoWeb)';
  }
}
