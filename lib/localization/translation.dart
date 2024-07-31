import 'package:get/get.dart';

import 'app_localization.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          AppLocalization.deliveryAdminPanel: "لوحة التجكم",
          AppLocalization.confirmation: 'التأكيد',
          AppLocalization.cancel: 'إلغاء',
          AppLocalization.ok: 'موافق',
          AppLocalization.loading: "جاري التحميل...",
//==================================Start Login Messages================================
          AppLocalization.logintoyouraccount: 'تسجيل الدخول إلى حسابك',
          AppLocalization.email: "البريد الإلكتروني",
          AppLocalization.requiredField: "حقل مطلوب",
          AppLocalization.pleaseEnterValidEmail: "الرجاء ادخال ايميل صحيح",
          AppLocalization.password: "كلمة المرور",
          AppLocalization.shortPasswordRule:
              "كلمة السر يجب أن تكون اكبر من 5 رموز",
          AppLocalization.longPasswordRule: "كلمة السر طويلة جدا",
          AppLocalization.forgetPassword: "هل نسيت كلمة السر؟",
          AppLocalization.signIn: "تسجيل الدخول",
          AppLocalization.orLoginWith: "او تسجيل الدخول باستخدام",
          AppLocalization.dontHaveAccount: "ليس لديك حساب؟",
          AppLocalization.signUp: "انشاء حساب",
//==================================End Login Messages================================
//
//
//==================================Start Register Messages================================
          AppLocalization.createNewAccount: 'انشاء حساب جديد',
          AppLocalization.confirmPassword: 'تأكيد كلمة المرور',
          AppLocalization.name: "الاسم",
          AppLocalization.register: "تسجيل",
          AppLocalization.alreadyHaveAcc: 'هل لديك حساب؟',
          AppLocalization.login: 'تسجيل الدخول',
          AppLocalization.orRegisterWith: 'او انشاء حساب بواسطة',
//==================================End Register Messages================================
//
//
//==================================Start Password Messages================================

          AppLocalization.checkEmail: 'التحقق من الايميل',
          AppLocalization.enterYourEmailForOpt:
              'الرجاء ادخال بريدك الالكتروني لتلقي رمز التحقق',
          AppLocalization.enterYourPhoneForOpt:
              'الرجاء ادخال رقم هاتفك لتلقي رمز التحقق',
          AppLocalization.next: 'التالي',
          AppLocalization.verification: 'التحقق',
          AppLocalization.emailVerification: 'التحقق من الايميل',
          AppLocalization.phoneVerification: 'التحقق من رقم الهاتف',
          AppLocalization.usePhoneNumber: 'استخدام رقم الهاتف',

          AppLocalization.checkPhone: 'التحقق من رقم الهاتف',

          AppLocalization.useEmail: 'استخدام الإيميل',
          AppLocalization.phone: 'رقم الهاتف',
          AppLocalization.error: 'خطأ',
          AppLocalization.pleaseEnterVerifyEmailCode:
              'فضلاً ادخل الكود المرسل لبريدك الإلكتروني للتحقق من حسابك',
          AppLocalization.pleaseEnterVerifyPhoneCode:
              'فضلاً ادخل الكود المرسل لهاتف للتحقق من حسابك',
          AppLocalization.resetYourPassword: 'اعادة ظبط كلمة المرور',
          AppLocalization.pleaseEnterYourNewPasswordDownHere:
              ' فضلاً ادخل كلمة المرور الجديدة بالاسفل',
          AppLocalization.newPassword: 'كلمة مرور جديدة',
          AppLocalization.submit: 'ادخال',
          AppLocalization.resendCode: 'إعادة إرسال الكود',
          AppLocalization.resendCodeAfter: 'إعادة إرسال الكود بعد',
          AppLocalization.seconds: 'ثواني',
          AppLocalization.successResetPassword: 'تم تغيير كلمة المرور بنجاح',

//==================================End Password Messages================================
//
//

//==================================Products================================

          AppLocalization.products: 'المنتجات',
          AppLocalization.doYouWantToUpdateProductStatus:
              'هل تريد تغيير حالة المنتج',
          AppLocalization.avaliable: 'متوفر',
          AppLocalization.notAvaliable: 'غير متوفر',
          AppLocalization.productStatusChangedSuccessfuly:
              'تم تغيير حالة المنتج بنجاح',
        },
      };
}
