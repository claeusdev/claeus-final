const show = ( () => {

	let _newPrdtButton; 
	let _storeSettingsBtn;



	let fetchElements = () => {
	 _newPrdtButton = $('.add-product');
	 _storeSettingsBtn = $('#storeSettings');
	};

	let hideElements = () => {
		_newPrdtButton.hide();
		_storeSettingsBtn.hide();
	};

	let showElements = () => {
		_newPrdtButton.show();
		_storeSettingsBtn.show();
	};

	let init = () => {
		fetchElements();
		showElements();

		_newPrdtButton.on('click', () => {
			
		});
	};

	return {
		init: init
	};
})();

