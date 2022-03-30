class ESTUDIANTE {
  String? id;
  List<ASISTENCIAESTUDIANTE>? aSISTENCIAESTUDIANTE;
  List<PERSONAJEESTUDIANTE>? pERSONAJEESTUDIANTE;
  String? cODESTUDIANTE;
  String? cODUNIDAD;
  String? nOMBREESTUDIANTE;
  String? aPELLIDOESTUDIANTE;
  String? fECHAINSCRIPCION;
  String? fECHANACIMIENTO;
  String? cORREOESTUDIANTE;

  ESTUDIANTE(
      {this.id,
      this.aSISTENCIAESTUDIANTE,
      this.pERSONAJEESTUDIANTE,
      this.cODESTUDIANTE,
      this.cODUNIDAD,
      this.nOMBREESTUDIANTE,
      this.aPELLIDOESTUDIANTE,
      this.fECHAINSCRIPCION,
      this.fECHANACIMIENTO,
      this.cORREOESTUDIANTE});

  ESTUDIANTE.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    if (json['ASISTENCIAESTUDIANTE'] != null) {
      aSISTENCIAESTUDIANTE = <ASISTENCIAESTUDIANTE>[];
      json['ASISTENCIAESTUDIANTE'].forEach((v) {
        aSISTENCIAESTUDIANTE?.add(ASISTENCIAESTUDIANTE.fromJson(v));
      });
    }
    if (json['PERSONAJEESTUDIANTE'] != null) {
      pERSONAJEESTUDIANTE = <PERSONAJEESTUDIANTE>[];
      json['PERSONAJEESTUDIANTE'].forEach((v) {
        pERSONAJEESTUDIANTE?.add(PERSONAJEESTUDIANTE.fromJson(v));
      });
    }
    cODESTUDIANTE = json['CODESTUDIANTE'];
    cODUNIDAD = json['CODUNIDAD'];
    nOMBREESTUDIANTE = json['NOMBREESTUDIANTE'];
    aPELLIDOESTUDIANTE = json['APELLIDOESTUDIANTE'];
    fECHAINSCRIPCION = json['FECHAINSCRIPCION'];
    fECHANACIMIENTO = json['FECHANACIMIENTO'];
    cORREOESTUDIANTE = json['CORREOESTUDIANTE'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$id'] = id;
    if (aSISTENCIAESTUDIANTE != null) {
      data['ASISTENCIAESTUDIANTE'] =
          aSISTENCIAESTUDIANTE?.map((v) => v.toJson()).toList();
    }
    if (pERSONAJEESTUDIANTE != null) {
      data['PERSONAJEESTUDIANTE'] =
          pERSONAJEESTUDIANTE?.map((v) => v.toJson()).toList();
    }
    data['CODESTUDIANTE'] = cODESTUDIANTE;
    data['CODUNIDAD'] = cODUNIDAD;
    data['NOMBREESTUDIANTE'] = nOMBREESTUDIANTE;
    data['APELLIDOESTUDIANTE'] = aPELLIDOESTUDIANTE;
    data['FECHAINSCRIPCION'] = fECHAINSCRIPCION;
    data['FECHANACIMIENTO'] = fECHANACIMIENTO;
    data['CORREOESTUDIANTE'] = cORREOESTUDIANTE;
    return data;
  }
}

class PERSONAJEESTUDIANTE {
  String? id;
  ESTUDIANTE? eSTUDIANTE;
  PERSONAJE? pERSONAJE;
  int? cONSECPERSONAJE;
  String? iDOBRA;
  String? iDPERSONAJE;
  String? cODESTUDIANTE;
  String? fECHAINICIOPERSONAJE;
  String? fECHAFINPERSONAJE;

  PERSONAJEESTUDIANTE(
      {this.id,
      this.eSTUDIANTE,
      this.pERSONAJE,
      this.cONSECPERSONAJE,
      this.iDOBRA,
      this.iDPERSONAJE,
      this.cODESTUDIANTE,
      this.fECHAINICIOPERSONAJE,
      this.fECHAFINPERSONAJE});

  PERSONAJEESTUDIANTE.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    eSTUDIANTE = json['ESTUDIANTE'] != null
        ? ESTUDIANTE?.fromJson(json['ESTUDIANTE'])
        : null;
    pERSONAJE = json['PERSONAJE'] != null
        ? PERSONAJE?.fromJson(json['PERSONAJE'])
        : null;
    cONSECPERSONAJE = json['CONSECPERSONAJE'];
    iDOBRA = json['IDOBRA'];
    iDPERSONAJE = json['IDPERSONAJE'];
    cODESTUDIANTE = json['CODESTUDIANTE'];
    fECHAINICIOPERSONAJE = json['FECHAINICIOPERSONAJE'];
    fECHAFINPERSONAJE = json['FECHAFINPERSONAJE'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$id'] = id;
    if (eSTUDIANTE != null) {
      data['ESTUDIANTE'] = eSTUDIANTE?.toJson();
    }
    if (pERSONAJE != null) {
      data['PERSONAJE'] = pERSONAJE?.toJson();
    }
    data['CONSECPERSONAJE'] = cONSECPERSONAJE;
    data['IDOBRA'] = iDOBRA;
    data['IDPERSONAJE'] = iDPERSONAJE;
    data['CODESTUDIANTE'] = cODESTUDIANTE;
    data['FECHAINICIOPERSONAJE'] = fECHAINICIOPERSONAJE;
    data['FECHAFINPERSONAJE'] = fECHAFINPERSONAJE;
    return data;
  }
}

class PERSONAJE {
  String? id;
  OBRA? oBRA;
  List<PERSONAJEESTUDIANTE>? pERSONAJEESTUDIANTE;
  String? iDOBRA;
  String? iDPERSONAJE;
  String? nOMPERSONAJE;

  PERSONAJE(
      {this.id,
      this.oBRA,
      this.pERSONAJEESTUDIANTE,
      this.iDOBRA,
      this.iDPERSONAJE,
      this.nOMPERSONAJE});

  PERSONAJE.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    oBRA = json['OBRA'] != null ? OBRA?.fromJson(json['OBRA']) : null;
    if (json['PERSONAJEESTUDIANTE'] != null) {
      pERSONAJEESTUDIANTE = <PERSONAJEESTUDIANTE>[];
      json['PERSONAJEESTUDIANTE'].forEach((v) {
        pERSONAJEESTUDIANTE?.add(PERSONAJEESTUDIANTE.fromJson(v));
      });
    }
    iDOBRA = json['IDOBRA'];
    iDPERSONAJE = json['IDPERSONAJE'];
    nOMPERSONAJE = json['NOMPERSONAJE'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$id'] = id;
    if (oBRA != null) {
      data['OBRA'] = oBRA?.toJson();
    }
    if (pERSONAJEESTUDIANTE != null) {
      data['PERSONAJEESTUDIANTE'] =
          pERSONAJEESTUDIANTE?.map((v) => v.toJson()).toList();
    }
    data['IDOBRA'] = iDOBRA;
    data['IDPERSONAJE'] = iDPERSONAJE;
    data['NOMPERSONAJE'] = nOMPERSONAJE;
    return data;
  }
}

class OBRA {
  String? id;
  List<CALENDARIO>? cALENDARIO;
  List<PERSONAJE>? pERSONAJE;
  String? iDOBRA;
  String? iDDRAMATURGO;
  String? cODPAIS;
  String? iDTIPOOBRA;
  String? fECHAOBRA;
  String? tITULO;
  double? eSTADO;

  OBRA(
      {this.id,
      this.cALENDARIO,
      this.pERSONAJE,
      this.iDOBRA,
      this.iDDRAMATURGO,
      this.cODPAIS,
      this.iDTIPOOBRA,
      this.fECHAOBRA,
      this.tITULO,
      this.eSTADO});

  OBRA.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    if (json['CALENDARIO'] != null) {
      cALENDARIO = <CALENDARIO>[];
      json['CALENDARIO'].forEach((v) {
        cALENDARIO?.add(CALENDARIO.fromJson(v));
      });
    }
    if (json['PERSONAJE'] != null) {
      pERSONAJE = <PERSONAJE>[];
      json['PERSONAJE'].forEach((v) {
        pERSONAJE?.add(PERSONAJE.fromJson(v));
      });
    }
    iDOBRA = json['IDOBRA'];
    iDDRAMATURGO = json['IDDRAMATURGO'];
    cODPAIS = json['CODPAIS'];
    iDTIPOOBRA = json['IDTIPOOBRA'];
    fECHAOBRA = json['FECHAOBRA'];
    tITULO = json['TITULO'];
    eSTADO = json['ESTADO'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$id'] = id;
    if (cALENDARIO != null) {
      data['CALENDARIO'] = cALENDARIO?.map((v) => v.toJson()).toList();
    }
    if (pERSONAJE != null) {
      data['PERSONAJE'] = pERSONAJE?.map((v) => v.toJson()).toList();
    }
    data['IDOBRA'] = iDOBRA;
    data['IDDRAMATURGO'] = iDDRAMATURGO;
    data['CODPAIS'] = cODPAIS;
    data['IDTIPOOBRA'] = iDTIPOOBRA;
    data['FECHAOBRA'] = fECHAOBRA;
    data['TITULO'] = tITULO;
    data['ESTADO'] = eSTADO;
    return data;
  }
}

class CALENDARIO {
  String? id;
  List<ASISTENCIAESTUDIANTE>? aSISTENCIAESTUDIANTE;
  OBRA? oBRA;
  ESTUDIANTE? tIPOCALENDARIO;
  int? cONSECCALENDARIO;
  String? iDOBRA;
  String? hORAFIN;
  String? cODTEATRO;
  String? iDTIPOCALENDARIO;
  String? hORAINICIO;
  String? ref;

  CALENDARIO(
      {this.id,
      this.aSISTENCIAESTUDIANTE,
      this.oBRA,
      this.tIPOCALENDARIO,
      this.cONSECCALENDARIO,
      this.iDOBRA,
      this.hORAFIN,
      this.cODTEATRO,
      this.iDTIPOCALENDARIO,
      this.hORAINICIO,
      this.ref});

  CALENDARIO.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    if (json['ASISTENCIAESTUDIANTE'] != null) {
      aSISTENCIAESTUDIANTE = <ASISTENCIAESTUDIANTE>[];
      json['ASISTENCIAESTUDIANTE'].forEach((v) {
        aSISTENCIAESTUDIANTE?.add(ASISTENCIAESTUDIANTE.fromJson(v));
      });
    }
    oBRA = json['OBRA'] != null ? OBRA?.fromJson(json['OBRA']) : null;
    tIPOCALENDARIO = json['TIPOCALENDARIO'] != null
        ? ESTUDIANTE?.fromJson(json['TIPOCALENDARIO'])
        : null;
    cONSECCALENDARIO = json['CONSECCALENDARIO'];
    iDOBRA = json['IDOBRA'];
    hORAFIN = json['HORAFIN'];
    cODTEATRO = json['CODTEATRO'];
    iDTIPOCALENDARIO = json['IDTIPOCALENDARIO'];
    hORAINICIO = json['HORAINICIO'];
    ref = json['$ref'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$id'] = id;
    if (aSISTENCIAESTUDIANTE != null) {
      data['ASISTENCIAESTUDIANTE'] =
          aSISTENCIAESTUDIANTE?.map((v) => v.toJson()).toList();
    }
    if (oBRA != null) {
      data['OBRA'] = oBRA?.toJson();
    }
    if (tIPOCALENDARIO != null) {
      data['TIPOCALENDARIO'] = tIPOCALENDARIO?.toJson();
    }
    data['CONSECCALENDARIO'] = cONSECCALENDARIO;
    data['IDOBRA'] = iDOBRA;
    data['HORAFIN'] = hORAFIN;
    data['CODTEATRO'] = cODTEATRO;
    data['IDTIPOCALENDARIO'] = iDTIPOCALENDARIO;
    data['HORAINICIO'] = hORAINICIO;
    data['$ref'] = ref;
    return data;
  }
}

class TIPOCALENDARIO {
  String? id;
  List<CALENDARIO>? cALENDARIO;
  String? iDTIPOCALENDARIO;
  String? dESCTIPOCALENDARIO;

  TIPOCALENDARIO(
      {this.id,
      this.cALENDARIO,
      this.iDTIPOCALENDARIO,
      this.dESCTIPOCALENDARIO});

  TIPOCALENDARIO.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    if (json['CALENDARIO'] != null) {
      cALENDARIO = <CALENDARIO>[];
      json['CALENDARIO'].forEach((v) {
        cALENDARIO?.add(CALENDARIO.fromJson(v));
      });
    }
    iDTIPOCALENDARIO = json['IDTIPOCALENDARIO'];
    dESCTIPOCALENDARIO = json['DESCTIPOCALENDARIO'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$id'] = id;
    if (cALENDARIO != null) {
      data['CALENDARIO'] = cALENDARIO?.map((v) => v.toJson()).toList();
    }
    data['IDTIPOCALENDARIO'] = iDTIPOCALENDARIO;
    data['DESCTIPOCALENDARIO'] = dESCTIPOCALENDARIO;
    return data;
  }
}

class ASISTENCIAESTUDIANTE {
  String? id;
  CALENDARIO? cALENDARIO;
  ESTUDIANTE? eSTUDIANTE;
  int? cONSECASIS;
  String? cODESTUDIANTE;
  String? iDOBRA;
  int? cONSECCALENDARIO;
  String? ref;

  ASISTENCIAESTUDIANTE(
      {this.id,
      this.cALENDARIO,
      this.eSTUDIANTE,
      this.cONSECASIS,
      this.cODESTUDIANTE,
      this.iDOBRA,
      this.cONSECCALENDARIO,
      this.ref});

  ASISTENCIAESTUDIANTE.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    cALENDARIO = json['CALENDARIO'] != null
        ? CALENDARIO?.fromJson(json['CALENDARIO'])
        : null;
    eSTUDIANTE = json['ESTUDIANTE'] != null
        ? ESTUDIANTE?.fromJson(json['ESTUDIANTE'])
        : null;
    cONSECASIS = json['CONSECASIS'];
    cODESTUDIANTE = json['CODESTUDIANTE'];
    iDOBRA = json['IDOBRA'];
    cONSECCALENDARIO = json['CONSECCALENDARIO'];
    ref = json['$ref'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$id'] = id;
    if (cALENDARIO != null) {
      data['CALENDARIO'] = cALENDARIO?.toJson();
    }
    if (eSTUDIANTE != null) {
      data['ESTUDIANTE'] = eSTUDIANTE?.toJson();
    }
    data['CONSECASIS'] = cONSECASIS;
    data['CODESTUDIANTE'] = cODESTUDIANTE;
    data['IDOBRA'] = iDOBRA;
    data['CONSECCALENDARIO'] = cONSECCALENDARIO;
    data['$ref'] = ref;
    return data;
  }
}
