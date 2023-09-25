import '../../data/local/farmer_form_fields.dart';
import '../../data/local/seed_producer_fields.dart';
import '../../data/local/service_provider_fields.dart';
import '../../naro_exporter.dart';
import 'profile_card_item.dart';

final profileItemsProvider = Provider<List<ProfileCardItem>>((ref) {
  // form service
  final formService = ref.watch(formServiceProvider);

  //
  final profileCards = [
    //* farmer form
    ProfileCardItem(
      title: 'Farmer',
      itemThumbnail: farmerPic,
      description: 'Continue as a farmer',
      category: 'farmer',
      form: AppForm(
        title: 'Farmer',
        description: 'Continue as a farmer',
        thumbnail: farmerPic,
        formKeyProvider: farmerFormKeyProvider,
        formFields: farmerFormFields,
        submit: formService.submitFarmerForm,
      ),
    ),

    // * seed producer form
    ProfileCardItem(
      title: 'Seed Producer',
      itemThumbnail: seedProducerPic,
      description: 'Continue as a seed producer',
      category: 'seed producer',
      form: AppForm(
        title: 'Seed Producer',
        description: 'Continue as a seed producer',
        thumbnail: seedProducerPic,
        formKeyProvider: seedProducerFormKeyProvider,
        formFields: seedProducerFormFields,
        submit: formService.submitSeedProducerForm,
      ),
    ),

    //* service provider form
    ProfileCardItem(
      title: 'Service Provider',
      itemThumbnail: serviceProviderPic,
      description: 'Continue as a service provider',
      category: 'service provider',
      form: AppForm(
        title: 'Service Provider',
        description: 'Continue as a service provider',
        thumbnail: serviceProviderPic,
        formKeyProvider: serviceProviderFormKeyProvider,
        formFields: serviceProviderFormFields,
        submit: formService.submitServiceProviderForm,
      ),
    ),
  ];

  return profileCards;
});
