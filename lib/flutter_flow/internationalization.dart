import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_Login
  {
    'waojflep': {
      'en': 'Welcome Back!',
      'es': '¡Bienvenido de nuevo!',
    },
    '753el2ug': {
      'en': 'Use the form below to access your account.',
      'es': 'Utilice el siguiente formulario para acceder a su cuenta.',
    },
    'hhglklhe': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'wgn5wlgf': {
      'en': 'Enter your email here...',
      'es': 'Introduzca su correo electrónico aquí...',
    },
    'z92g1y7o': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '1xzhkxh4': {
      'en': 'Enter your password here...',
      'es': 'Ingrese su contraseña aquí...',
    },
    'esxjzad2': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '8kuk88ml': {
      'en': 'Login',
      'es': 'Acceso',
    },
    'yk8pyyw3': {
      'en': 'Use a social platform to continue',
      'es': 'Utilice una plataforma social para continuar',
    },
    '7k34z52w': {
      'en': 'Don\'t have an account?',
      'es': '¿No tienes una cuenta?',
    },
    'zpdcksra': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'efi34085': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'mza25loy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'y8oqtr6x': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'qfe9vhu4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'nndvdj91': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // forgotPassword
  {
    'w59y0p7u': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
    },
    'e933brnz': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'es':
          '¿No recuerdas tu contraseña? Ingrese el correo electrónico asociado con su cuenta a continuación y le enviaremos un nuevo enlace.',
    },
    '1ntqbdr9': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    's3trytrs': {
      'en': 'Please enter a valid email...',
      'es':
          'Por favor introduzca una dirección de correo electrónico válida...',
    },
    'yarsqml9': {
      'en': 'Send Reset Link',
      'es': 'Enviar enlace de reinicio',
    },
    'oh1r8rn6': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // auth_Create
  {
    '1thhjaoz': {
      'en': 'name',
      'es': 'nombre',
    },
    'd5k0hgo7': {
      'en': 'Enter your name here...',
      'es': 'Introduzca su nombre aquí...',
    },
    'dk0r753h': {
      'en': 'celular number',
      'es': 'numero celular',
    },
    'n6wn25da': {
      'en': 'Enter your celular number here...',
      'es': 'Ingresa tu número de celular aquí...',
    },
    'ptkdzjwh': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    '1odq62cu': {
      'en': 'Enter your email here...',
      'es': 'Introduzca su correo electrónico aquí...',
    },
    'byk0msab': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '43vmihcf': {
      'en': 'Create your password...',
      'es': 'Crea tu contraseña...',
    },
    'z7c7p4qg': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    '2nzkl3hm': {
      'en': 'Create your password...',
      'es': 'Crea tu contraseña...',
    },
    'jo0u3wii': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    '5gjin1j7': {
      'en': 'Already have an account?',
      'es': '¿Ya tienes una cuenta?',
    },
    '8jt39yqe': {
      'en': 'Log In',
      'es': 'Acceso',
    },
    'pz8rmpsn': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Main_Home
  {
    'mnv0kv5i': {
      'en': 'Dashboard',
      'es': 'Panel',
    },
    'd9ibsozx': {
      'en': 'Below is a summary of your teams activity.',
      'es':
          'A continuación se muestra un resumen de la actividad de su equipo.',
    },
    'xt98wytq': {
      'en': 'New Customers',
      'es': 'nuevos clientes',
    },
    'wedlibv7': {
      'en': '24',
      'es': '24',
    },
    'u0hm2q46': {
      'en': 'New Contracts',
      'es': 'Nuevos contratos',
    },
    '3np077b2': {
      'en': '3,200',
      'es': '3.200',
    },
    'ku3cm4l4': {
      'en': 'Expired Contracts',
      'es': 'Contratos vencidos',
    },
    '203wqokf': {
      'en': '4300',
      'es': '4300',
    },
    'pby4848p': {
      'en': 'Projects',
      'es': 'Proyectos',
    },
    'cmoeb25d': {
      'en': 'UI Design Team',
      'es': 'Equipo de diseño de interfaz de usuario',
    },
    'zw9ztief': {
      'en': '4 Members',
      'es': '4 miembros',
    },
    'x769q2kl': {
      'en': 'Contract Activity',
      'es': 'Actividad contractual',
    },
    'ljjc615f': {
      'en': 'Below is an a summary of activity.',
      'es': 'A continuación se muestra un resumen de la actividad.',
    },
    'qjbx2j0h': {
      'en': 'Customer Activity',
      'es': 'Actividad del cliente',
    },
    'e40ftky8': {
      'en': 'Below is an a summary of activity.',
      'es': 'A continuación se muestra un resumen de la actividad.',
    },
    '0qk445co': {
      'en': 'Contract Activity',
      'es': 'Actividad contractual',
    },
    '7pmgr4cv': {
      'en': 'Below is an a summary of activity.',
      'es': 'A continuación se muestra un resumen de la actividad.',
    },
    '5o8cirsy': {
      'en': 'Customer Activity',
      'es': 'Actividad del cliente',
    },
    '356qvfte': {
      'en': 'Below is an a summary of activity.',
      'es': 'A continuación se muestra un resumen de la actividad.',
    },
    'iwweut0h': {
      'en': 'Dashboard',
      'es': 'Panel',
    },
    'edqhm1rh': {
      'en': '__',
      'es': '__',
    },
  },
  // Main_customerList
  {
    'paw0s62z': {
      'en': 'Customers',
      'es': 'Clientes',
    },
    'kug1tyk1': {
      'en': 'Invite Users',
      'es': 'Invitar usuarios',
    },
    'exuqyw8q': {
      'en': 'All',
      'es': 'Todo',
    },
    '8d65cp63': {
      'en': 'New Calls',
      'es': 'Nuevas convocatorias',
    },
    'iecd9zlu': {
      'en': 'Contacted',
      'es': 'Contactado',
    },
    'ukej1anw': {
      'en': 'Customers',
      'es': 'Clientes',
    },
    'pr3u2jal': {
      'en': '__',
      'es': '__',
    },
  },
  // Main_Contracts
  {
    '7zlemppc': {
      'en': 'Contracts',
      'es': 'Contratos',
    },
    '0jipm41a': {
      'en': 'Contracts',
      'es': 'Contratos',
    },
    'g22ufsyk': {
      'en': 'Projects',
      'es': 'Proyectos',
    },
    '7alvkzso': {
      'en': 'No-Code Platform Design',
      'es': 'Diseño de plataforma sin código',
    },
    'hsvvhgs3': {
      'en': 'Design Team Docs',
      'es': 'Documentos del equipo de diseño',
    },
    'fvwkrxv4': {
      'en': 'Contracts',
      'es': 'Contratos',
    },
    'jf5y20us': {
      'en': 'ACME Co.',
      'es': 'ACME Co.',
    },
    '4szywyrj': {
      'en': 'Contracts for New Opportunities',
      'es': 'Contratos para nuevas oportunidades',
    },
    '29kygwx8': {
      'en': 'Next Action',
      'es': 'Proxima accion',
    },
    '87o0ruj9': {
      'en': 'Tuesday, 10:00am',
      'es': 'Martes, 10:00 a.m.',
    },
    'ihwmtj2z': {
      'en': 'In Progress',
      'es': 'En curso',
    },
    'd26owcgq': {
      'en': 'HealthAi',
      'es': 'SaludAi',
    },
    'kzfsyaal': {
      'en': 'Client Acquisition for Q3',
      'es': 'Adquisición de clientes para el tercer trimestre',
    },
    'mxfg3n0z': {
      'en': 'Next Action',
      'es': 'Proxima accion',
    },
    'r7z2op8s': {
      'en': 'Tuesday, 10:00am',
      'es': 'Martes, 10:00 a.m.',
    },
    'jbq748eb': {
      'en': 'In Progress',
      'es': 'En curso',
    },
    'wlcoyawp': {
      'en': '__',
      'es': '__',
    },
  },
  // Main_messages
  {
    '554vd0rm': {
      'en': 'Messages',
      'es': 'Mensajes',
    },
    '7sv1qga6': {
      'en': 'Search messages here...',
      'es': 'Buscar mensajes aquí...',
    },
    '0u0jrf05': {
      'en': 'Randy Mcdonald',
      'es': 'Randy McDonald',
    },
    'udfiefwx': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'es':
          'Esto fue realmente genial, estoy muy contento de haber podido ponernos al día este fin de semana.',
    },
    'yzmmegyq': {
      'en': 'Mon. July 3rd - 4:12pm',
      'es': 'Lun. 3 de julio - 4:12 p.m.',
    },
    '5utchwuc': {
      'en': 'Randy Mcdonald',
      'es': 'Randy McDonald',
    },
    '3kdtlono': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'es':
          'Esto fue realmente genial, estoy muy contento de haber podido ponernos al día este fin de semana.',
    },
    'kei317ux': {
      'en': 'Mon. July 3rd - 4:12pm',
      'es': 'Lun. 3 de julio - 4:12 p.m.',
    },
    'p78q8p42': {
      'en': 'Randy Mcdonald',
      'es': 'Randy McDonald',
    },
    '0ozkwchu': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'es':
          'Esto fue realmente genial, estoy muy contento de haber podido ponernos al día este fin de semana.',
    },
    '32y7l1vu': {
      'en': 'Mon. July 3rd - 4:12pm',
      'es': 'Lun. 3 de julio - 4:12 p.m.',
    },
    'b80oihv0': {
      'en':
          'I am a freelancer and I need help writing content for a proposal for a project. Can I give you some context for the projecct I need to write a proposal for?',
      'es':
          'Soy autónomo y necesito ayuda para redactar contenido para una propuesta de proyecto. ¿Puedo darle algún contexto para el proyecto para el que necesito escribir una propuesta?',
    },
    'fa3hcbb0': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    'h20osq6z': {
      'en': 'Hey really love what you are doing!',
      'es': '¡Oye, realmente amo lo que estás haciendo!',
    },
    'zs82wn2v': {
      'en': 'a few moments ago',
      'es': 'hace unos momentos',
    },
    'epzu4m9a': {
      'en': 'This is my intro video',
      'es': 'Este es mi vídeo de introducción.',
    },
    'oiybse4p': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    'ws68r2ck': {
      'en': 'Hey really love what you are doing!',
      'es': '¡Oye, realmente amo lo que estás haciendo!',
    },
    'edwr0b4m': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    'bq8f12wj': {
      'en': 'Hey really love what you are doing!',
      'es': '¡Oye, realmente amo lo que estás haciendo!',
    },
    '6j8rspdw': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    '38wv8ntc': {
      'en': 'Start typing here...',
      'es': 'Empieza a escribir aquí...',
    },
    '2gwdxyp6': {
      'en': 'Dashboard',
      'es': 'Panel',
    },
    'a53ndtj8': {
      'en': '__',
      'es': '__',
    },
  },
  // Main_profilePage
  {
    'xvp9zlaj': {
      'en': 'My Profile',
      'es': 'Mi perfil',
    },
    '37m62uk7': {
      'en': 'Account Settings',
      'es': 'Configuraciones de la cuenta',
    },
    'uvit4yc0': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
    },
    '2h4ubznn': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'ajonrjl9': {
      'en': 'Update Theme',
      'es': 'Actualizar tema',
    },
    'lxj6s9kp': {
      'en':
          'Update the theme of your application from seleccting one of the options below.',
      'es':
          'Actualice el tema de su aplicación seleccionando una de las siguientes opciones.',
    },
    'd8vr0vqt': {
      'en': 'Dark Mode',
      'es': 'Modo oscuro',
    },
    '9gk9go7z': {
      'en': 'Light Mode',
      'es': 'Modo de luz',
    },
    'iq0f7wlp': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
    },
    'dytsjhiz': {
      'en': '__',
      'es': '__',
    },
  },
  // userDetails
  {
    'kwckpda8': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // editProfile
  {
    'rfrd202y': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
    },
    'gqjw5gx7': {
      'en': 'Your Name',
      'es': 'Su nombre',
    },
    '0jk2ynm2': {
      'en': 'Your apellido',
      'es': 'tu apellido',
    },
    '9pr0krta': {
      'en': 'Your phone number',
      'es': 'Su número de teléfono',
    },
    'nxhy54dd': {
      'en': 'Your cedula number',
      'es': 'Tu número de cédula',
    },
    'jrjwcarg': {
      'en': 'Your Name farmacia',
      'es': 'Tu nombre farmacia',
    },
    '296x8sba': {
      'en': 'pharmacys adress',
      'es': 'dirección de farmacias',
    },
    'itj9alzq': {
      'en': 'province',
      'es': 'provincia',
    },
    'ssltzl62': {
      'en': 'city',
      'es': 'ciudad',
    },
    '275fcsgy': {
      'en': 'RUC  PHARMACYS',
      'es': 'FARMACIA RUC',
    },
    'fw75kazd': {
      'en': 'The email associated with this account is:',
      'es': 'El correo electrónico asociado a esta cuenta es:',
    },
    'zptji2zf': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
    },
    'kpc7e1lx': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
  },
  // projectDetailsHealthAi
  {
    'srl923mr': {
      'en': 'HealthAi',
      'es': 'SaludAi',
    },
    'rot0vgbj': {
      'en': 'Client Acquisition for Q3',
      'es': 'Adquisición de clientes para el tercer trimestre',
    },
    'g5sj67yt': {
      'en': 'Next Action',
      'es': 'Proxima accion',
    },
    'tszfbddc': {
      'en': 'Tuesday, 10:00am',
      'es': 'Martes, 10:00 a.m.',
    },
    'xyxe2w0q': {
      'en': 'In Progress',
      'es': 'En curso',
    },
    'b7loat5m': {
      'en': 'Contract Details',
      'es': 'Detalles del contrato',
    },
    'xs4b30r2': {
      'en': '\$125,000',
      'es': '\$125,000',
    },
    'b81xwc5d': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'es':
          '¡Detalles adicionales sobre este contrato y quién está trabajando en él en esta tarjeta!',
    },
    'hs1nkzae': {
      'en': 'Mark as Complete',
      'es': 'Marcar como completo',
    },
    '55l6hf95': {
      'en': 'Contract Details',
      'es': 'Detalles del contrato',
    },
    'onapl1ri': {
      'en': '\$67,000',
      'es': '\$67,000',
    },
    'ogzrjewu': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'es':
          '¡Detalles adicionales sobre este contrato y quién está trabajando en él en esta tarjeta!',
    },
    'kqx8ipdy': {
      'en': 'Mark as Complete',
      'es': 'Marcar como completo',
    },
    '8rbbdnyd': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // projectDetails
  {
    'bxxefzug': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // searchPage
  {
    'ujvk6li0': {
      'en': 'Add Members',
      'es': 'Añadir miembros',
    },
    '0hi2lw4j': {
      'en': 'Search members...',
      'es': 'Buscar miembros...',
    },
    '5b485cso': {
      'en': 'Option 1',
      'es': 'Opción 1',
    },
    'o0b2xcd0': {
      'en': 'All Members',
      'es': 'Todos los miembros',
    },
    'b5zbmlep': {
      'en': 'View',
      'es': 'Vista',
    },
    'wioj65j3': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // messagesDetails
  {
    'djmem1di': {
      'en':
          'I am a freelancer and I need help writing content for a proposal for a project. Can I give you some context for the projecct I need to write a proposal for?',
      'es':
          'Soy autónomo y necesito ayuda para redactar contenido para una propuesta de proyecto. ¿Puedo darle algún contexto para el proyecto para el que necesito escribir una propuesta?',
    },
    'qob7y7g4': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    '52pckvyh': {
      'en': 'Hey really love what you are doing!',
      'es': '¡Oye, realmente amo lo que estás haciendo!',
    },
    'v3ic2ulb': {
      'en': 'a few moments ago',
      'es': 'hace unos momentos',
    },
    '3gl0kytl': {
      'en': 'This is my intro video',
      'es': 'Este es mi vídeo de introducción.',
    },
    '2ktfnso2': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    'xymhy53y': {
      'en': 'Hey really love what you are doing!',
      'es': '¡Oye, realmente amo lo que estás haciendo!',
    },
    '9eyyqluk': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    '617qh6uh': {
      'en': 'Hey really love what you are doing!',
      'es': '¡Oye, realmente amo lo que estás haciendo!',
    },
    'cocorlqx': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    '6dcunkjg': {
      'en': 'Start typing here...',
      'es': 'Empieza a escribir aquí...',
    },
    'oh4xltmj': {
      'en': 'Chat Details',
      'es': 'Detalles del chat',
    },
    'op7u5emy': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // modal_success
  {
    'xlz1uec0': {
      'en': 'Send Contract Confirmation',
      'es': 'Enviar confirmación de contrato',
    },
    'o64vbem8': {
      'en': 'A new contract has been generated for:',
      'es': 'Se ha generado un nuevo contrato para:',
    },
    '081wtun4': {
      'en': 'Randy Alcorn',
      'es': 'Randy Alcorn',
    },
    '8sz7x4sw': {
      'en': 'Head of Procurement',
      'es': 'Jefe de Adquisiciones',
    },
    'xcihz704': {
      'en': 'ACME Co.',
      'es': 'ACME Co.',
    },
    '6ntmf211': {
      'en': 'Next Steps',
      'es': 'Próximos pasos',
    },
    '384iqeso': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'es':
          'Envía la información a continuación. Y enviaremos un correo electrónico con detalles al cliente y le permitiremos administrarlo en su panel de control.',
    },
    'hpf7m8kg': {
      'en': 'Send Information',
      'es': 'Enviar información',
    },
    'tbiyh0gr': {
      'en': 'Never Mind',
      'es': 'No importa',
    },
  },
  // modal_Message
  {
    'r07byzng': {
      'en': 'Congratulations!',
      'es': '¡Felicidades!',
    },
    'zjk309b0': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'es':
          'Ahora que se ha generado un contrato para este cliente, comuníquese con él para indicarle la fecha en que enviará el acuerdo firmado.',
    },
    'k65qp4r0': {
      'en': 'Okay',
      'es': 'Bueno',
    },
    'dr73l623': {
      'en': 'Continue',
      'es': 'Continuar',
    },
  },
  // modal_Welcome
  {
    't3g8u2j0': {
      'en': 'Congratulations!',
      'es': '¡Felicidades!',
    },
    'lgejrf2t': {
      'en': 'A new contract has been generated for:',
      'es': 'Se ha generado un nuevo contrato para:',
    },
    '9oawp2kx': {
      'en': 'Continue',
      'es': 'Continuar',
    },
  },
  // createComment
  {
    'b2t6buk5': {
      'en': 'Create Note',
      'es': 'Crear nota',
    },
    'apqnuzzj': {
      'en': 'Find members by searching below',
      'es': 'Encuentre miembros buscando a continuación',
    },
    'jkp3284p': {
      'en': 'Ricky Rodriguez',
      'es': 'Ricky Rodríguez',
    },
    'dgi85vgz': {
      'en': 'Enter your note here...',
      'es': 'Introduce tu nota aquí...',
    },
    'rgbhxojr': {
      'en': 'Create Note',
      'es': 'Crear nota',
    },
  },
  // mobileNav
  {
    '2nc4bouh': {
      'en': 'Dashboard',
      'es': 'Panel',
    },
    'welwv6sl': {
      'en': 'My Team',
      'es': 'Mi equipo',
    },
    'unn3k7rc': {
      'en': 'Customers',
      'es': 'Clientes',
    },
    'dxji90gf': {
      'en': 'Contracts',
      'es': 'Contratos',
    },
    '6gzjiy9l': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // webNav
  {
    'etvxbtjt': {
      'en': 'Search',
      'es': 'Buscar',
    },
    'vaed75hx': {
      'en': 'Dashboard',
      'es': 'Panel',
    },
    'z4o1o6d1': {
      'en': 'Customers',
      'es': 'Clientes',
    },
    'p30agsa7': {
      'en': 'Contracts',
      'es': 'Contratos',
    },
    '222eefo0': {
      'en': 'Messages',
      'es': 'Mensajes',
    },
    '0t2h8czc': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // commandPalette
  {
    '3blril3a': {
      'en': 'Search platform...',
      'es': 'Plataforma de búsqueda...',
    },
    'ow094ash': {
      'en': 'Search',
      'es': 'Buscar',
    },
    'r4x1l1z4': {
      'en': 'Quick Links',
      'es': 'enlaces rápidos',
    },
    'h39x6s09': {
      'en': 'Add Quiz',
      'es': 'Agregar cuestionario',
    },
    'mctuok7q': {
      'en': 'Find Customer',
      'es': 'Encontrar cliente',
    },
    '5j2xrcq3': {
      'en': 'New Project',
      'es': 'Nuevo proyecto',
    },
    'ey8jad0j': {
      'en': 'New Customer',
      'es': 'Nuevo cliente',
    },
  },
  // editProfilePhoto
  {
    'eyl4amow': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
    },
    'j8u8qg2b': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'es':
          'Sube una nueva foto a continuación para cambiar tu avatar visto por otros.',
    },
    'e3pej3pm': {
      'en': 'Upload Image',
      'es': 'Cargar imagen',
    },
    'zw5ndzd8': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
    },
  },
  // user_Details_main
  {
    'wd8htwvn': {
      'en': 'Customer Name',
      'es': 'Nombre del cliente',
    },
    'l3ja4eht': {
      'en': 'Randy Alcorn',
      'es': 'Randy Alcorn',
    },
    'wkqfp9e5': {
      'en': 'High Profile',
      'es': 'De alto perfil',
    },
    'fjbkybq5': {
      'en': 'Title',
      'es': 'Título',
    },
    '08ntstov': {
      'en': 'Head of Procurement',
      'es': 'Jefe de Adquisiciones',
    },
    'd52pu2e7': {
      'en': 'Company',
      'es': 'Compañía',
    },
    'hoxe1dat': {
      'en': 'ACME Co.',
      'es': 'ACME Co.',
    },
    'ei0j64mt': {
      'en': 'Notes',
      'es': 'Notas',
    },
    'gtmijtfa': {
      'en': 'Alexandria Smith',
      'es': 'Alejandría Smith',
    },
    '5hd9nfmz': {
      'en': '1m ago',
      'es': 'hace 1m',
    },
    'sug2256x': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    'jmousmok': {
      'en': '8',
      'es': '8',
    },
    '21q4x7k7': {
      'en': 'Notes',
      'es': 'Notas',
    },
    'pf88dpie': {
      'en': 'Randy Alcorn',
      'es': 'Randy Alcorn',
    },
    'l222hjwc': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'es':
          'No estoy muy seguro acerca de esta sección aquí. ¡Creo que deberías hacer algo interesante!',
    },
    'pzs9ii07': {
      'en': 'a min ago',
      'es': 'hace un minuto',
    },
    'au5wasln': {
      'en': 'Generate Quote',
      'es': 'Generar cotización',
    },
    't8jguhuf': {
      'en': 'View Company',
      'es': 'Ver empresa',
    },
  },
  // dropdown_UserEdit
  {
    'un93sa67': {
      'en': 'Options',
      'es': 'Opciones',
    },
    'rzg2hqac': {
      'en': 'Edit',
      'es': 'Editar',
    },
    'pon2pijs': {
      'en': 'Assign',
      'es': 'Asignar',
    },
    'mi0u1o0e': {
      'en': 'Share',
      'es': 'Compartir',
    },
    'vj848yub': {
      'en': 'Delete',
      'es': 'Borrar',
    },
  },
  // modal_CreateProject
  {
    'ensqinr2': {
      'en': 'Create Project',
      'es': 'Crear proyecto',
    },
    'h4cpxngm': {
      'en': 'Please enter the information below to add a project.',
      'es':
          'Por favor ingrese la información a continuación para agregar un proyecto.',
    },
    'w2x9im6v': {
      'en': 'Add Photo',
      'es': 'Añadir foto',
    },
    '6iems7bj': {
      'en': 'Project Name',
      'es': 'Nombre del proyecto',
    },
    'pwm3rzr9': {
      'en': 'Description here...',
      'es': 'Descripción aquí...',
    },
    'aiimlano': {
      'en': 'Create Project',
      'es': 'Crear proyecto',
    },
    '6fawx8w1': {
      'en': 'Please enter a project name...',
      'es': 'Por favor ingrese un nombre de proyecto...',
    },
    'wjf45l9t': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'o3lou7nj': {
      'en': 'Please enter a short description...',
      'es': 'Por favor ingrese una breve descripción...',
    },
    'a7qbgfec': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // projectDetails_alt
  {
    'mpkp47n0': {
      'en': 'ACME Co.',
      'es': 'ACME Co.',
    },
    'jpd495j6': {
      'en': 'Contracts for New Opportunities',
      'es': 'Contratos para nuevas oportunidades',
    },
    '3ap13rc2': {
      'en': 'Assigned To',
      'es': 'Asignado a',
    },
    'vip9hekm': {
      'en': 'Randy Rudolph',
      'es': 'Randy Rudolph',
    },
    'whkgyxh5': {
      'en': 'name@domain.com',
      'es': 'nombre@dominio.com',
    },
    '43jh6v06': {
      'en': 'Next Action',
      'es': 'Proxima accion',
    },
    'kht2az46': {
      'en': 'Tuesday, 10:00am',
      'es': 'Martes, 10:00 a.m.',
    },
    '7q92p633': {
      'en': 'In Progress',
      'es': 'En curso',
    },
    'dqrf0gph': {
      'en': 'Activity',
      'es': 'Actividad',
    },
    'sd07n4yn': {
      'en': 'FlutterFlow CRM App:',
      'es': 'Aplicación FlutterFlow CRM:',
    },
    '4h7i40f8': {
      'en': ' Begin Work',
      'es': 'comenzar a trabajar',
    },
    'nuxg3nfi': {
      'en': 'SOW Change Order',
      'es': 'Orden de cambio de SOW',
    },
    'q7m0zmsl': {
      'en': 'FlutterFlow CRM App',
      'es': 'Aplicación FlutterFlow CRM',
    },
    'rfr74zna': {
      'en': 'Jul 8, at 4:31pm',
      'es': '8 de julio a las 16:31',
    },
    'vzc6dot5': {
      'en': 'Jeremiah Goldsten ',
      'es': 'Jeremías Goldsten',
    },
    'mcm8lzjm': {
      'en': 'accepted a request',
      'es': 'aceptó una solicitud',
    },
    'etue90gr': {
      'en': 'SOW Change Order',
      'es': 'Orden de cambio de SOW',
    },
    'xojadr14': {
      'en': 'FlutterFlow CRM App',
      'es': 'Aplicación FlutterFlow CRM',
    },
    '09in7woa': {
      'en':
          '\"Notifications and reminders informing users about upcoming classes and training schedules will be sent to them via email, SMS or notifications within the application.\"',
      'es':
          '\"Las notificaciones y recordatorios que informarán a los usuarios sobre las próximas clases y horarios de capacitación se les enviarán por correo electrónico, SMS o notificaciones dentro de la aplicación\".',
    },
    '76c111f4': {
      'en': 'Jul 8, at 4:30pm',
      'es': '8 de julio a las 16:30',
    },
    'deo99imi': {
      'en': 'Randy Rudolph ',
      'es': 'Randy Rudolph',
    },
    '81wuqq7a': {
      'en': 'sent a SOW Change Order for ',
      'es': 'envió una orden de cambio SOW para',
    },
    'jl37al4f': {
      'en': 'FlutterFlow CRM APP',
      'es': 'Aplicación FlutterFlow CRM',
    },
    'iywbkiqj': {
      'en': 'SOW Change Order',
      'es': 'Orden de cambio de SOW',
    },
    '8n3t9jt4': {
      'en': 'FlutterFlow CRM App',
      'es': 'Aplicación FlutterFlow CRM',
    },
    'imvslws0': {
      'en':
          '\"Please review the updates to this document and get back with me.\"',
      'es':
          '\"Revise las actualizaciones de este documento y comuníquese conmigo\".',
    },
    '7xsbsqib': {
      'en': 'Jul 8, at 2:20pm',
      'es': '8 de julio a las 14:20',
    },
    'm5p6zl5t': {
      'en': 'Contracts',
      'es': 'Contratos',
    },
    'dzua53hy': {
      'en': 'Updates to Existing App',
      'es': 'Actualizaciones de la aplicación existente',
    },
    'vxynsf23': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'es':
          '¡Detalles adicionales sobre este contrato y quién está trabajando en él en esta tarjeta!',
    },
    'psvgpp4p': {
      'en': 'Contract Details',
      'es': 'Detalles del contrato',
    },
    '58c4jnuf': {
      'en': '\$210,000',
      'es': '\$210,000',
    },
    '8hsazp20': {
      'en': 'Mark as Complete',
      'es': 'Marcar como completo',
    },
    '9rmd3el0': {
      'en': 'New FlutterFlow App',
      'es': 'Nueva aplicación FlutterFlow',
    },
    'zndvivhq': {
      'en':
          'The user can browse through our extensive catalog of fitness classes by filtering based on class type, location, time, and instructor. Each class will have detailed descriptions of the program, instructors, timings, availability, and rates.',
      'es':
          'El usuario puede navegar a través de nuestro extenso catálogo de clases de fitness filtrando según el tipo de clase, la ubicación, el horario y el instructor. Cada clase tendrá descripciones detalladas del programa, instructores, horarios, disponibilidad y tarifas.',
    },
    'bnpwl2j0': {
      'en': 'Contract Details',
      'es': 'Detalles del contrato',
    },
    'sqtwtno7': {
      'en': '\$67,000',
      'es': '\$67,000',
    },
    'lb5jjz85': {
      'en': 'Mark as Complete',
      'es': 'Marcar como completo',
    },
    '4ct0cwqa': {
      'en': 'Project Details',
      'es': 'detalles del proyecto',
    },
  },
  // modal_create_Company
  {
    'izyo9b43': {
      'en': 'Create Company Profile',
      'es': 'Crear perfil de empresa',
    },
    '686mkioq': {
      'en':
          'Upload images about your company and fill out the information below.',
      'es':
          'Sube imágenes sobre tu empresa y completa la información a continuación.',
    },
    'mzm6rypp': {
      'en': 'Company Name',
      'es': 'nombre de empresa',
    },
    'jxgdhw5o': {
      'en': 'Company City',
      'es': 'Ciudad de la empresa',
    },
    '3s9lh854': {
      'en': 'Website',
      'es': 'Sitio web',
    },
    'h4ajkt58': {
      'en': 'Enter in your website without \"https://\"...',
      'es': 'Entra en tu sitio web sin \"https://\"...',
    },
    '6lii3v81': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '2qdz310w': {
      'en': 'Create Company',
      'es': 'Crear empresa',
    },
  },
  // modal_inviteUser
  {
    'kake0j14': {
      'en': 'Edit User Details',
      'es': 'Editar detalles de usuario',
    },
    'wxt4h6iy': {
      'en': 'Edit the details of the user below.',
      'es': 'Edite los detalles del usuario a continuación.',
    },
    'm9e168nk': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
    },
    'gaufsuae': {
      'en': 'name@domainname.com',
      'es': 'nombre@nombrededominio.com',
    },
    'j0zlx43j': {
      'en': 'User Name',
      'es': 'Nombre de usuario',
    },
    '0vo1eps6': {
      'en': 'Bio',
      'es': 'Biografía',
    },
    'rdpkfqnf': {
      'en': 'Admin',
      'es': 'Administración',
    },
    'z44ro9wg': {
      'en': 'Manager',
      'es': 'Gerente',
    },
    'aou7ukhm': {
      'en': 'Editor',
      'es': 'Editor',
    },
    'vv1yq2kb': {
      'en': 'Viewer',
      'es': 'Espectador',
    },
    '0lgql5e3': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
    },
    'umyurcu6': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'v5v6p91g': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'og8q0fxf': {
      'en': 'Send Invites',
      'es': 'Enviar invitaciones',
    },
  },
  // modal_enterPin
  {
    'm0nxg82l': {
      'en': 'Enter your PIN below',
      'es': 'Ingrese su PIN a continuación',
    },
    'mobw7o1p': {
      'en': 'Your project has been created, now invite your team to continue.',
      'es': 'Tu proyecto ha sido creado, ahora invita a tu equipo a continuar.',
    },
    '8xz8dfa7': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'gf1iy9il': {
      'en': 'Verify Code',
      'es': 'Código de verificación',
    },
  },
  // modal_shareProject
  {
    'wd5meuao': {
      'en': 'Share your project',
      'es': 'Comparte tu proyecto',
    },
    'sxad1vxh': {
      'en': 'Your project has been created, now invite your team to continue.',
      'es': 'Tu proyecto ha sido creado, ahora invita a tu equipo a continuar.',
    },
    '78fq8sfx': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
    },
    'zqxgn3wc': {
      'en': 'name@domainname.com',
      'es': 'nombre@nombrededominio.com',
    },
    'd93tjh7q': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
    },
    'jaokvmeg': {
      'en': 'name@domainname.com',
      'es': 'nombre@nombrededominio.com',
    },
    '1mgdoudr': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
    },
    'u0xvmv6b': {
      'en': 'name@domainname.com',
      'es': 'nombre@nombrededominio.com',
    },
    'ovt5dsrj': {
      'en': 'Add User',
      'es': 'Agregar usuario',
    },
    'f5xq954x': {
      'en': 'Project Link',
      'es': 'Enlace del proyecto',
    },
    'qk2uviup': {
      'en': 'https://project.flutterflow.io/?quizRef=T7c8mXvkYFFCWjqyhxKe',
      'es': 'https://project.flutterflow.io/?quizRef=T7c8mXvkYFFCWjqyhxKe',
    },
    'eydp5kjl': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'h5e277wo': {
      'en': 'Send Invites',
      'es': 'Enviar invitaciones',
    },
  },
  // Modal_Add_usersList
  {
    '1ioyzuxr': {
      'en': 'Invite your Team',
      'es': 'Invita a tu equipo',
    },
    '81oegefg': {
      'en': 'Your project has been created, now invite your team to continue.',
      'es': 'Tu proyecto ha sido creado, ahora invita a tu equipo a continuar.',
    },
    '0qz50y4z': {
      'en': 'Email address...',
      'es': 'Dirección de correo electrónico...',
    },
    'aq5a816b': {
      'en': 'email@domainname.com',
      'es': 'correo electrónico@nombrededominio.com',
    },
    'srb1lb6y': {
      'en': 'email@domainname.com',
      'es': 'correo electrónico@nombrededominio.com',
    },
    'fqrc9ncq': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'f69364s6': {
      'en': 'Send Invites',
      'es': 'Enviar invitaciones',
    },
  },
  // modal_profile_Details
  {
    'xomvxxvh': {
      'en': 'Profile Details',
      'es': 'detalles del perfil',
    },
    '8ju8eggl': {
      'en': 'Below are your profile details',
      'es': 'A continuación se muestran los detalles de su perfil.',
    },
    'sedrfwj1': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
    },
    '12m93vxe': {
      'en': 'name@domainname.com',
      'es': 'nombre@nombrededominio.com',
    },
    '2tdjwmg9': {
      'en': 'Manage your account',
      'es': 'Gestiona tu cuenta',
    },
    'axs6sli6': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'rzkg2ohj': {
      'en': 'Reset Password',
      'es': 'Restablecer la contraseña',
    },
    'g1mj2y0o': {
      'en': 'Light Mode',
      'es': 'Modo de luz',
    },
    'v91szat4': {
      'en': 'Dark Mode',
      'es': 'Modo oscuro',
    },
    '5eext268': {
      'en': 'Get in Touch',
      'es': 'Ponerse en contacto',
    },
    'm02q2fpo': {
      'en': 'Help & Support',
      'es': 'Servicio de asistencia',
    },
    '8dikeg94': {
      'en': 'Share [App Name]',
      'es': 'Compartir [Nombre de la aplicación]',
    },
    '7eghiksm': {
      'en': 'Close',
      'es': 'Cerca',
    },
  },
  // modal_profile_Edit
  {
    'k2etanmz': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'zkuj82f1': {
      'en': 'Below are your profile details',
      'es': 'A continuación se muestran los detalles de su perfil.',
    },
    'uwydx0gs': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
    },
    'lxbrqkf8': {
      'en': 'Your Name',
      'es': 'Su nombre',
    },
    'zsxfu8uh': {
      'en': 'Short Description',
      'es': 'Breve descripción',
    },
    '67uu7dzx': {
      'en': 'Admin',
      'es': 'Administración',
    },
    'b4icw3kb': {
      'en': 'Admin',
      'es': 'Administración',
    },
    '6jn1akhw': {
      'en': 'Manager',
      'es': 'Gerente',
    },
    'vcirvgqb': {
      'en': 'Editor',
      'es': 'Editor',
    },
    'dds5qmjx': {
      'en': 'Viewer',
      'es': 'Espectador',
    },
    'ux0evros': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
    },
    '2zz8oe6h': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'oz16aiv0': {
      'en': 'The email associated with this account is:',
      'es': 'El correo electrónico asociado a esta cuenta es:',
    },
    '4bhhduhm': {
      'en': 'casper@ghostbusters.com',
      'es': 'casper@cazafantasmas.com',
    },
    'ithzfnfg': {
      'en': 'Created On:',
      'es': 'Creado en:',
    },
    'nhwvbc6e': {
      'en': 'July 12th, 2023',
      'es': '12 de julio de 2023',
    },
    'r1zm0ptc': {
      'en': 'Last Active:',
      'es': 'Último Activo:',
    },
    'cv54cwvb': {
      'en': 'Just Now',
      'es': 'En este momento',
    },
    'bms369po': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'hihjsedo': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
    },
  },
  // Miscellaneous
  {
    '0nwoj0kc': {
      'en': 'Email address',
      'es': 'Dirección de correo electrónico',
    },
    'upni203i': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'x5hsigqw': {
      'en': 'Button',
      'es': 'Botón',
    },
    '9wy77t9v': {
      'en': 'Button',
      'es': 'Botón',
    },
    'woezzutp': {
      'en': 'Button',
      'es': 'Botón',
    },
    '2bj20mi4': {
      'en': 'Button',
      'es': 'Botón',
    },
    'oztjr3ws': {
      'en': 'Button',
      'es': 'Botón',
    },
    'hc87g50d': {
      'en': 'Button',
      'es': 'Botón',
    },
    '8ct6cr3a': {
      'en': 'Button',
      'es': 'Botón',
    },
    'e368pegn': {
      'en': 'Button',
      'es': 'Botón',
    },
    'yv65a6i5': {
      'en': 'Button',
      'es': 'Botón',
    },
    '4r7kaahz': {
      'en': 'Calling',
      'es': 'Vocación',
    },
    '9zk4wopm': {
      'en': 'Not Called',
      'es': 'No llamado',
    },
    'xn2fkope': {
      'en': 'Pending Review',
      'es': 'Revisión pendiente',
    },
    'jv85czds': {
      'en': 'Closed',
      'es': 'Cerrado',
    },
    'swt4x372': {
      'en': 'Completed',
      'es': 'Terminado',
    },
    '5w6ne1dl': {
      'en': 'Please select...',
      'es': 'Por favor seleccione...',
    },
    'uhfmgei0': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'lted0txl': {
      'en': 'All',
      'es': 'Todo',
    },
    'm6iqz668': {
      'en': 'Pending',
      'es': 'Pendiente',
    },
    'x2pvxk5r': {
      'en': 'Completed',
      'es': 'Terminado',
    },
    'txjoh349': {
      'en': 'Calling',
      'es': 'Vocación',
    },
    'qube3xir': {
      'en': 'All',
      'es': 'Todo',
    },
    'mxalfkji': {
      'en': '50%',
      'es': '50%',
    },
    'z6o24u9q': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    'poegde7v': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    'v3vjad01': {
      'en': 'Turn on notifications',
      'es': 'Activar las notificaciones',
    },
    'bqjgqich': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'rzl2h9ar': {
      'en': 'Female',
      'es': 'Femenino',
    },
    'qtchqf19': {
      'en': 'Other',
      'es': 'Otro',
    },
    '82a75t5n': {
      'en': 'Design',
      'es': 'Diseño',
    },
    'w82xuklg': {
      'en': 'Marketing',
      'es': 'Marketing',
    },
    '5uiyxwtk': {
      'en': 'Development',
      'es': 'Desarrollo',
    },
    '3wjkerx7': {
      'en': 'Management',
      'es': 'Gestión',
    },
    'p6rgfj1v': {
      'en': 'Operations',
      'es': 'Operaciones',
    },
    'c8uww550': {
      'en': 'Customer Service',
      'es': 'Servicio al Cliente',
    },
    '2rhm2suy': {
      'en': 'Design',
      'es': 'Diseño',
    },
    'hxsxj681': {
      'en': '',
      'es': '',
    },
    'e7agr7ys': {
      'en': '',
      'es': '',
    },
    '65e2tfs2': {
      'en': '',
      'es': '',
    },
    'ddazihx4': {
      'en': '',
      'es': '',
    },
    'db03cpjj': {
      'en': '',
      'es': '',
    },
    'fdb9078p': {
      'en': '',
      'es': '',
    },
    '80ouzj9q': {
      'en': '',
      'es': '',
    },
    '6rzhptp9': {
      'en': '',
      'es': '',
    },
    'ce8c4ty0': {
      'en': '',
      'es': '',
    },
    '3m5q9gpu': {
      'en': '',
      'es': '',
    },
    'pxv1krkq': {
      'en': '',
      'es': '',
    },
    'kcvqa08x': {
      'en': '',
      'es': '',
    },
    'dqrzd6sq': {
      'en': '',
      'es': '',
    },
    'dpqtohyf': {
      'en': '',
      'es': '',
    },
    'v01vf71s': {
      'en': '',
      'es': '',
    },
    'gcv6def1': {
      'en': '',
      'es': '',
    },
    'um9es99m': {
      'en': '',
      'es': '',
    },
    'o4enbz4j': {
      'en': '',
      'es': '',
    },
    '8z4tvfh7': {
      'en': '',
      'es': '',
    },
    '2ybzla8x': {
      'en': '',
      'es': '',
    },
    'd1wdf5i1': {
      'en': '',
      'es': '',
    },
    'f4rdu9en': {
      'en': '',
      'es': '',
    },
    '2py80kgi': {
      'en': '',
      'es': '',
    },
    'p6lsrh2a': {
      'en': '',
      'es': '',
    },
    'ne8cclp9': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
