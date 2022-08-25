//ESX MENU: https://github.com/esx-framework
(function(){

	let MenuTpl =
		'<div id="menu_{{_namespace}}_{{_name}}" class="menu">' +
			'<div class="head"><div class="head__title">{{{title}}}</div><div class="head__description">Bir işlem seçin</div></div>' +
				'<div class="menu-items">' +
					'{{#elements}}' +
						'<div class="menu-item {{#selected}}selected{{/selected}}">' +
							'{{{label}}}{{#isSlider}} : &lt;{{{sliderLabel}}}&gt;{{/isSlider}}' +
						'</div>' +
					'{{/elements}}' +
				'</div>' +
			'</div>' +
		'</div>'
	;

	window.tgiCore       = {};
	tgiCore.ResourceName = 'tgiann-core';
	tgiCore.opened       = {};
	tgiCore.focus        = [];
	tgiCore.pos          = {};

	tgiCore.open = function(namespace, name, data) {

		if (typeof tgiCore.opened[namespace] == 'undefined') {
			tgiCore.opened[namespace] = {};
		}

		if (typeof tgiCore.opened[namespace][name] != 'undefined') {
			tgiCore.close(namespace, name);
		}

		if (typeof tgiCore.pos[namespace] == 'undefined') {
			tgiCore.pos[namespace] = {};
		}

		for (let i=0; i<data.elements.length; i++) {
			if (typeof data.elements[i].type == 'undefined') {
				data.elements[i].type = 'default';
			}
		}

		data._index     = tgiCore.focus.length;
		data._namespace = namespace;
		data._name      = name;

		for (let i=0; i<data.elements.length; i++) {
			data.elements[i]._namespace = namespace;
			data.elements[i]._name      = name;
		}

		tgiCore.opened[namespace][name] = data;
		tgiCore.pos   [namespace][name] = 0;

		for (let i=0; i<data.elements.length; i++) {
			if (data.elements[i].selected) {
				tgiCore.pos[namespace][name] = i;
			} else {
				data.elements[i].selected = false;
			}
		}

		tgiCore.focus.push({
			namespace: namespace,
			name     : name
		});

		tgiCore.render();
		$('#menu_' + namespace + '_' + name).find('.menu-item.selected')[0].scrollIntoView();
	};

	tgiCore.close = function(namespace, name) {

		delete tgiCore.opened[namespace][name];

		for (let i=0; i<tgiCore.focus.length; i++) {
			if (tgiCore.focus[i].namespace == namespace && tgiCore.focus[i].name == name) {
				tgiCore.focus.splice(i, 1);
				break;
			}
		}

		tgiCore.render();

	};

	tgiCore.render = function() {

		let menuContainer       = document.getElementById('menus');
		let focused             = tgiCore.getFocused();
		menuContainer.innerHTML = '';

		$(menuContainer).hide();

		for (let namespace in tgiCore.opened) {
			for (let name in tgiCore.opened[namespace]) {

				let menuData = tgiCore.opened[namespace][name];
				let view     = JSON.parse(JSON.stringify(menuData));

				for (let i=0; i<menuData.elements.length; i++) {
					let element = view.elements[i];

					switch (element.type) {
						case 'default' : break;

						case 'slider' : {
							element.isSlider    = true;
							element.sliderLabel = (typeof element.options == 'undefined') ? element.value : element.options[element.value];

							break;
						}

						default : break;
					}

					if (i == tgiCore.pos[namespace][name]) {
						element.selected = true;
					}
				}

				let menu = $(Mustache.render(MenuTpl, view))[0];
				$(menu).hide();
				menuContainer.appendChild(menu);
			}
		}

		if (typeof focused != 'undefined') {
			$('#menu_' + focused.namespace + '_' + focused.name).show();
		}

		$(menuContainer).show();

	};

	tgiCore.submit = function(namespace, name, data) {
		$.post('https://' + tgiCore.ResourceName + '/menu_submit', JSON.stringify({
			_namespace: namespace,
			_name     : name,
			current   : data,
			elements  : tgiCore.opened[namespace][name].elements
		}));
	};

	tgiCore.cancel = function(namespace, name) {
		$.post('https://' + tgiCore.ResourceName + '/menu_cancel', JSON.stringify({
			_namespace: namespace,
			_name     : name
		}));
	};

	tgiCore.change = function(namespace, name, data) {
		$.post('https://' + tgiCore.ResourceName + '/menu_change', JSON.stringify({
			_namespace: namespace,
			_name     : name,
			current   : data,
			elements  : tgiCore.opened[namespace][name].elements
		}));
	};

	tgiCore.getFocused = function() {
		return tgiCore.focus[tgiCore.focus.length - 1];
	};

	window.onData = (data) => {

		switch (data.action) {

			case 'openMenu': {
				tgiCore.open(data.namespace, data.name, data.data);
				break;
			}

			case 'closeMenu': {
				tgiCore.close(data.namespace, data.name);
				break;
			}

			case 'controlPressed': {

				switch (data.control) {

					case 'ENTER': {
						let focused = tgiCore.getFocused();

						if (typeof focused != 'undefined') {
							let menu    = tgiCore.opened[focused.namespace][focused.name];
							let pos     = tgiCore.pos[focused.namespace][focused.name];
							let elem    = menu.elements[pos];

							if (menu.elements.length > 0) {
								tgiCore.submit(focused.namespace, focused.name, elem);
							}
						}

						break;
					}

					case 'BACKSPACE': {
						let focused = tgiCore.getFocused();

						if (typeof focused != 'undefined') {
							tgiCore.cancel(focused.namespace, focused.name);
						}

						break;
					}

					case 'TOP': {

						let focused = tgiCore.getFocused();

						if (typeof focused != 'undefined') {

							let menu = tgiCore.opened[focused.namespace][focused.name];
							let pos  = tgiCore.pos[focused.namespace][focused.name];

							if (pos > 0) {
								tgiCore.pos[focused.namespace][focused.name]--;
							} else {
								tgiCore.pos[focused.namespace][focused.name] = menu.elements.length - 1;
							}

							let elem = menu.elements[tgiCore.pos[focused.namespace][focused.name]];

							for (let i=0; i<menu.elements.length; i++) {
								if (i == tgiCore.pos[focused.namespace][focused.name]) {
									menu.elements[i].selected = true;
								} else {
									menu.elements[i].selected = false;
								}
							}

							tgiCore.change(focused.namespace, focused.name, elem);
							tgiCore.render();

							$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
						}

						break;

					}

					case 'DOWN' : {

						let focused = tgiCore.getFocused();

						if (typeof focused != 'undefined') {
							let menu   = tgiCore.opened[focused.namespace][focused.name];
							let pos    = tgiCore.pos[focused.namespace][focused.name];
							let length = menu.elements.length;

							if (pos < length - 1) {
								tgiCore.pos[focused.namespace][focused.name]++;
							} else {
								tgiCore.pos[focused.namespace][focused.name] = 0;
							}

							let elem = menu.elements[tgiCore.pos[focused.namespace][focused.name]];

							for (let i=0; i<menu.elements.length; i++) {
								if (i == tgiCore.pos[focused.namespace][focused.name]) {
									menu.elements[i].selected = true;
								} else {
									menu.elements[i].selected = false;
								}
							}

							tgiCore.change(focused.namespace, focused.name, elem);
							tgiCore.render();

							$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
						}

						break;
					}

					case 'LEFT' : {

						let focused = tgiCore.getFocused();

						if (typeof focused != 'undefined') {
							let menu = tgiCore.opened[focused.namespace][focused.name];
							let pos  = tgiCore.pos[focused.namespace][focused.name];
							let elem = menu.elements[pos];

							switch(elem.type) {
								case 'default': break;

								case 'slider': {
									let min = (typeof elem.min == 'undefined') ? 0 : elem.min;

									if (elem.value > min) {
										elem.value--;
										tgiCore.change(focused.namespace, focused.name, elem);
									}

									tgiCore.render();
									break;
								}

								default: break;
							}

							$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
						}

						break;
					}

					case 'RIGHT' : {

						let focused = tgiCore.getFocused();

						if (typeof focused != 'undefined') {
							let menu = tgiCore.opened[focused.namespace][focused.name];
							let pos  = tgiCore.pos[focused.namespace][focused.name];
							let elem = menu.elements[pos];

							switch(elem.type) {
								case 'default': break;

								case 'slider': {
									if (typeof elem.options != 'undefined' && elem.value < elem.options.length - 1) {
										elem.value++;
										tgiCore.change(focused.namespace, focused.name, elem);
									}

									if (typeof elem.max != 'undefined' && elem.value < elem.max) {
										elem.value++;
										tgiCore.change(focused.namespace, focused.name, elem);
									}

									tgiCore.render();
									break;
								}

								default: break;
							}

							$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
						}

						break;
					}

					default : break;

				}

				break;
			}

		}

	};

	window.onload = function(e){
		window.addEventListener('message', (event) => {
			onData(event.data);
		});
	};

})();
