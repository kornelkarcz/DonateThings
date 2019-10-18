$(function () {

    $.validator.setDefaults({
        errorClass: 'custom-error-class',
        highlight: function (element) {
            $(element)
                .closest('.add-institution-form-item')
                .addClass('has-errors');
        },
        unhighlight: function (element) {
            $(element)
                .closest('.add-institution-form-item')
                .removeClass('has-errors');
        },
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        }
    });

    $.validator.addMethod('onlyNumbers', function (value, element) {
        return this.optional(element)
            || /^[0-9]*$/.test(value);
    }, 'Numbers only');

    $.validator.addMethod('strongPassword', function (value, element) {
        return this.optional(element)
            || /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(value);
    }, 'Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character');

    $.validator.addMethod('mobilePhone', function (value, element) {
        return this.optional(element)
            || /^\d{3}-\d{3}-\d{3}$/.test(value);
    }, 'Mobile phone number should consist of 9 digits');

    $.validator.addMethod('postalCode', function (value, element) {
        return this.optional(element)
            || /^\d{2}(-\d{3})$/.test(value);

    }, 'Please enter Polish postal code');

    $('.addInstitutionForm').validate({
        rules: {
            name: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            'address.street': {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            'address.houseNumber': {
                required: true,
                maxlength: 4,
                onlyNumbers: true

            },
            'address.flatNumber': {
                required: true,
                maxlength: 4,
                onlyNumbers: true

            },
            'address.city': {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            'address.postalCode': {
                required: true,
                postalCode: true
            }

        },
        messages: {
            name: {
                required: 'Please enter a name of institution.',
                minlength: 'Name should be at least 5-letter long.',
                maxlength: 'Name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            'address.street': {
                required: 'Please enter a street name of institution.',
                minlength: 'Street name should be at least 5-letter long.',
                maxlength: 'Street name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            'address.houseNumber': {
                required: 'Please enter a house number.',
                maxlength: 'House number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            'address.flatNumber': {
                required: 'Please enter a flat number of institution.',
                maxlength: 'Flat number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            'address.city': {
                required: 'Please enter a city name of institution.',
                minlength: 'City name should be at least 5-letter long.',
                maxlength: 'City name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            'address.postalCode': {
                required: 'Please enter a postal code of institution.'
            }
        }
    });

    $('.form-register').validate({
        rules: {
            firstName: {
                required: true,
                nowhitespace: true,
                lettersonly: true
            },
            lastName: {
                required: true,
                nowhitespace: true,
                lettersonly: true
            },
            email: {
                required: true,
                email: true,
                nowhitespace: true
            },
            password: {
                required: true,
                strongPassword: true
            },
            matchingPassword: {
                required: true,
                equalTo: '#password'
            }
        },
        messages: {
            firstName: {
                required: 'Please enter your first name.',
                nowhitespace: 'Do not user whitespaces',
                lettersonly: 'Please use letters only'
            },
            lastName: {
                required: 'Please enter your last name.',
                nowhitespace: 'Do not user whitespaces',
                lettersonly: 'Please use letters only'
            },
            email: {
                required: 'Please enter your email.',
                email: 'Please enter valid email',
                nowhitespace: 'Do not user whitespaces'
            },
            password: {
                required: 'Please enter password'
            },
            matchingPassword: {
                required: 'Please re-enter password',
                equalTo: "Passwords do not match"
            }
        }
    });

    $('#organize-collection-form').validate({
        rules: {
            contentDescription: {
                required: true,
                letterswithbasicpunc: true,
                maxlength: 30
            },
            phoneNumber: {
                required: true,
                mobilePhone: true
            },
            comment: {
                required: true,
            },
            streetName: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            houseNumber: {
                required: true,
                maxlength: 4,
                onlyNumbers: true
            },
            flatNumber: {
                required: true,
                maxlength: 4,
                onlyNumbers: true
            },
            city: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            postalCode: {
                required: true,
                postalCode: true
            },
            institution: {
                required: true
            }
        },
        messages: {
            contentDescription: {
                required: "Please enter the type of the collection",
                letterswithbasicpunc: "Please use only letters and basic punctuation",
            },
            phoneNumber: {
                required: 'Please enter phone number',
                mobilePhone: 'Invalid phone number'
            },
            comment: {
                required: "Please enter any comment"
            },
            street: {
                required: 'Please enter a street name of institution.',
                minlength: 'Street name should be at least 5-letter long.',
                maxlength: 'Street name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            houseNumber: {
                required: 'Please enter a house number.',
                maxlength: 'House number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            flatNumber: {
                required: 'Please enter a flat number of institution.',
                maxlength: 'Flat number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            city: {
                required: 'Please enter a city name of institution.',
                minlength: 'City name should be at least 5-letter long.',
                maxlength: 'City name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            postalCode: {
                required: 'Please enter a postal code of institution.'
            },
            institution: {
                required: 'Please select institution.'
            }
        }
    });

    $('.edit-collection-form').validate({
        rules: {
            contentDescription: {
                required: true,
                letterswithbasicpunc: true,
                maxlength: 30
            },
            phoneNumber: {
                required: true,
                mobilePhone: true
            },
            comment: {
                required: true,
            },
            streetName: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            houseNumber: {
                required: true,
                maxlength: 4,
                onlyNumbers: true
            },
            flatNumber: {
                required: true,
                maxlength: 4,
                onlyNumbers: true
            },
            city: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            postalCode: {
                required: true,
                postalCode: true
            },
            institution: {
                required: true
            }
        },
        messages: {
            contentDescription: {
                required: "Please enter the type of the collection",
                letterswithbasicpunc: "Please use only letters and basic punctuation",
            },
            phoneNumber: {
                required: 'Please enter phone number',
                mobilePhone: 'Invalid phone number'
            },
            comment: {
                required: "Please enter any comment"
            },
            street: {
                required: 'Please enter a street name of institution.',
                minlength: 'Street name should be at least 5-letter long.',
                maxlength: 'Street name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            houseNumber: {
                required: 'Please enter a house number.',
                maxlength: 'House number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            flatNumber: {
                required: 'Please enter a flat number of institution.',
                maxlength: 'Flat number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            city: {
                required: 'Please enter a city name of institution.',
                minlength: 'City name should be at least 5-letter long.',
                maxlength: 'City name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            postalCode: {
                required: 'Please enter a postal code of institution.'
            },
            institution: {
                required: 'Please select institution.'
            }
        }
    });

    $('#donate-form').validate({
        rules: {
            numberOfBags: {
                required: true,
                onlyNumbers: true,
                maxlength: 3
            },
            contentDescription: {
                required: true,
                letterswithbasicpunc: true,
                maxlength: 30
            },
            phoneNumber: {
                required: true,
                mobilePhone: true
            },
            comment: {
                required: true,
            },
            streetName: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            houseNumber: {
                required: true,
                maxlength: 4,
                onlyNumbers: true
            },
            flatNumber: {
                required: true,
                maxlength: 4,
                onlyNumbers: true
            },
            city: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            postalCode: {
                required: true,
                postalCode: true
            },
            institution: {
                required: true
            }
        },
        messages: {
            numberOfBags: {
                required: "Please enter number of bags",
                onlyNumbers: "Please use numbers only",
                maxlength: "Number of bags should not be longer then 3 digits"
            },
            contentDescription: {
                required: "Please enter the type of the collection",
                letterswithbasicpunc: "Please use only letters and basic punctuation",
            },
            phoneNumber: {
                required: 'Please enter phone number',
                mobilePhone: 'Invalid phone number'
            },
            comment: {
                required: "Please enter any comment"
            },
            street: {
                required: 'Please enter a street name of institution.',
                minlength: 'Street name should be at least 5-letter long.',
                maxlength: 'Street name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            houseNumber: {
                required: 'Please enter a house number.',
                maxlength: 'House number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            flatNumber: {
                required: 'Please enter a flat number of institution.',
                maxlength: 'Flat number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            city: {
                required: 'Please enter a city name of institution.',
                minlength: 'City name should be at least 5-letter long.',
                maxlength: 'City name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            postalCode: {
                required: 'Please enter a postal code of institution.'
            },
            institution: {
                required: 'Please select institution.'
            }
        }
    });
    $('.edit-donation-form').validate({
        rules: {
            numberOfBags: {
                required: true,
                onlyNumbers: true,
                maxlength: 3
            },
            contentDescription: {
                required: true,
                letterswithbasicpunc: true,
                maxlength: 30
            },
            phoneNumber: {
                required: true,
                mobilePhone: true
            },
            comment: {
                required: true,
            },
            streetName: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            houseNumber: {
                required: true,
                maxlength: 4,
                onlyNumbers: true
            },
            flatNumber: {
                required: true,
                maxlength: 4,
                onlyNumbers: true
            },
            city: {
                required: true,
                minlength: 5,
                maxlength: 30,
                letterswithbasicpunc: true
            },
            postalCode: {
                required: true,
                postalCode: true
            },
            institution: {
                required: true
            }
        },
        messages: {
            numberOfBags: {
                required: "Please enter number of bags",
                onlyNumbers: "Please use numbers only",
                maxlength: "Number of bags should not be longer then 3 digits"
            },
            contentDescription: {
                required: "Please enter the type of the collection",
                letterswithbasicpunc: "Please use only letters and basic punctuation",
            },
            phoneNumber: {
                required: 'Please enter phone number',
                mobilePhone: 'Invalid phone number'
            },
            comment: {
                required: "Please enter any comment"
            },
            street: {
                required: 'Please enter a street name of institution.',
                minlength: 'Street name should be at least 5-letter long.',
                maxlength: 'Street name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            houseNumber: {
                required: 'Please enter a house number.',
                maxlength: 'House number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            flatNumber: {
                required: 'Please enter a flat number of institution.',
                maxlength: 'Flat number should not be longer than 4 digits',
                onlyNumbers: "Please use only numbers"
            },
            city: {
                required: 'Please enter a city name of institution.',
                minlength: 'City name should be at least 5-letter long.',
                maxlength: 'City name should not be longer than 30 letters',
                letterswithbasicpunc: "Please use only letters and basic punctuation"
            },
            postalCode: {
                required: 'Please enter a postal code of institution.'
            },
            institution: {
                required: 'Please select institution.'
            }
        }
    });

    $('.form-edit-personal-details').validate({
        rules: {
            firstName: {
                required: true,
                nowhitespace: true,
                lettersonly: true
            },
            lastName: {
                required: true,
                nowhitespace: true,
                lettersonly: true
            }
        },
        messages: {
            firstName: {
                required: 'Please enter your first name.',
                nowhitespace: 'Do not user whitespaces',
                lettersonly: 'Please use letters only'
            },
            lastName: {
                required: 'Please enter your last name.',
                nowhitespace: 'Do not user whitespaces',
                lettersonly: 'Please use letters only'
            }
        }
    });

    $('.reset-password-form').validate({
        rules: {
            newPassword: {
                required: true,
                strongPassword: true
            },
            matchingPassword: {
                required: true,
                equalTo: '#newPassword'
            }
        },
        messages: {
            newPassword: {
                required: 'Please enter new password.'
            },
            matchingPassword: {
                required: 'Please re-enter new password.',
                equalTo: 'Passwords do not match'
            }
        }
    });

    $('.form-forgot-password').validate({
        rules: {
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            required: 'Please enter your email',
            email: 'Please enter valid email'
        }
    });

    $('.change-password-form').validate({
        rules: {
            oldPassword: {
                required: true,
            },
            newPassword: {
                required: true,
                strongPassword: true,
            },
            matchingPassword: {
                required: true,
                equalTo: '#newPassword'
            }
        },
        messages: {
            oldPassword: {
                required: 'Please enter your old password.'
            },
            newPassword: {
                required: 'Please enter new password.'
            },
            matchingPassword: {
                required: ' Re-enter new password.',
                equalTo: 'Passwords do not match'
            }
        }
    });

    $('input[name="address.postalCode"]').mask('00-000');
    $('input[name="postalCode"]').mask('00-000');
    $('input[name="phoneNumber"]').mask('000-000-000');
});