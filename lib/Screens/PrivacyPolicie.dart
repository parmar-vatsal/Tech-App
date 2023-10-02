import 'package:flutter/material.dart';

class PrivacyPoliceSC extends StatefulWidget {
  @override
  State<PrivacyPoliceSC> createState() => _PrivacyPoliceSCState();
}

class _PrivacyPoliceSCState extends State<PrivacyPoliceSC> {
  Future<bool> _onBackPressed() async {
    // Show confirmation dialog when the back button is pressed
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Exit the Application?',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: "Poppins-Regular"),
            ),
            content: const Text(
              'Are you sure you want to leave the Tech App?',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: "Poppins-Regular"),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Stay on the screen
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Leave the Privacy Policy
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset("Assets/img/Privacy_policy.png",
                    width: 260, alignment: Alignment.centerRight),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Overview',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Medium"),
              ),
              const SizedBox(height: 10),
              const Text(
                'Our refund and returns policy lasts 30 days. If 30 days have passed since your purchase, we can’t offer you a full refund or exchange.',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Several types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Additional non-returnable items:',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 10),
              const Text(
                '- Gift cards',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                '- Downloadable software products',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                '- Some health and personal care items',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              // Add more items as needed
              const SizedBox(height: 20),
              const Text(
                'To complete your return, we require a receipt or proof of purchase.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please do not send your purchase back to the manufacturer.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'There are certain situations where only partial refunds are granted:',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 10),
              const Text(
                '- Book with obvious signs of use',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                '- CD, DVD, VHS tape, software, video game, cassette tape, or vinyl record that has been opened.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                '- Any item not in its original condition, is damaged or missing parts for reasons not due to our error.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                '- Any item that is returned more than 30 days after delivery',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Refunds',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Medium"),
              ),
              const SizedBox(height: 10),
              const Text(
                'Once your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Late or missing refunds',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 10),
              const Text(
                'If you haven’t received a refund yet, first check your bank account again.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                'Then contact your credit card company, it may take some time before your refund is officially posted.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                'Next contact your bank. There is often some processing time before a refund is posted.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                'If you’ve done all of this and you still have not received your refund yet, please contact us at vatsalparmar5055@gmail.com.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sale items',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 10),
              const Text(
                'Only regular priced items may be refunded. Sale items cannot be refunded.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Exchanges',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Medium"),
              ),
              const SizedBox(height: 10),
              const Text(
                'We only replace items if they are defective or damaged. If you need to exchange it for the same item, send us an email at vatsalparmar5055@gmail.com and send your item to: Surat, Gujrat.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Gifts',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Medium"),
              ),
              const SizedBox(height: 10),
              const Text(
                'If the item was marked as a gift when purchased and shipped directly to you, you’ll receive a gift credit for the value of your return. Once the returned item is received, a gift certificate will be mailed to you.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                'If the item wasn’t marked as a gift when purchased, or the gift giver had the order shipped to themselves to give to you later, we will send a refund to the gift giver and they will find out about your return.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Shipping returns',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Medium"),
              ),
              const SizedBox(height: 10),
              const Text(
                'To return your product, you should mail your product to: Surat, Gujrat.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                'You will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                'Depending on where you live, the time it may take for your exchanged product to reach you may vary.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const Text(
                'If you are returning more expensive items, you may consider using a trackable shipping service or purchasing shipping insurance. We don’t guarantee that we will receive your returned item.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Need help?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Medium"),
              ),
              const SizedBox(height: 10),
              const Text(
                'Contact us at vatsalparmar5055@gmail.com for questions related to refunds and returns.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins-Regular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
