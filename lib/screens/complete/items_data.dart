import '../../data/local/farmer_form_fields.dart';
import '../../data/local/seed_producer_fields.dart';
import '../../data/local/service_provider_fields.dart';
import '../../data/providers/farmer_form_providers.dart';
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
      itemThumbnail: defaultProfilePic,
      description: 'Register as a farmer',
      category: 'farmer',
      form: AppForm(
        title: 'Farmer',
        description: 'Register as a farmer',
        thumbnail: defaultProfilePic,
        formKeyProvider: farmerFormKeyProvider,
        formFields: farmerFormFields,
        submit: formService.submitFarmerForm,
      ),
    ),

    // * seed producer form
    ProfileCardItem(
      title: 'Seed Producer',
      itemThumbnail: defaultProfilePic,
      description: 'Register as a seed producer',
      category: 'seed producer',
      form: AppForm(
        title: 'Seed Producer',
        description: 'Register as a seed producer',
        thumbnail: defaultProfilePic,
        formKeyProvider: seedProducerFormKeyProvider,
        formFields: seedProducerFormFields,
        submit: formService.submitSeedProducerForm,
      ),
    ),

    //* service provider form
    ProfileCardItem(
      title: 'Service Provider',
      itemThumbnail: defaultProfilePic,
      description: 'Register as a service provider',
      category: 'service provider',
      form: AppForm(
        title: 'Service Provider',
        description: 'Register as a service provider',
        thumbnail: defaultProfilePic,
        formKeyProvider: serviceProviderFormKeyProvider,
        formFields: serviceProviderFormFields,
        submit: formService.submitServiceProviderForm,
      ),
    ),
  ];

  return profileCards;
});
