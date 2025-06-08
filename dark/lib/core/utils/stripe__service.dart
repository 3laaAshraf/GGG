import 'package:dark/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:dark/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dark/core/utils/api_keys.dart';
import 'package:dark/core/utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var resoponse = await apiService.post(
        body: paymentIntentInputModel.tojson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);
    var paymentIntentModdel = PaymentIntentModel.fromJson(resoponse.data);
    return paymentIntentModdel;
  }
}
