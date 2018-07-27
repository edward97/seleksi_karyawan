<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * C45
 */
class C45
{
	protected $data;
	protected $attributes;
	protected $target;
	protected $rules;
	protected $finalRules;
	protected $hasilPrediksi;
	
	function setData(array $data) {
		$this->data = $data;
		return $this;
	}

	function setAttributes(array $attributes) {
		$this->attributes = $attributes;
		return $this;
	}

	function hitung() {
		$this->_hitung($this->data, $this->attributes);
		$this->generateRules();
	}

	function _hitung(array $data, array $attributes, $base = null, $kasus = null) {
		// menghitung jumlah data
		$jumlah_data = count($data);

		// mengambil data kolom target
		$kolom_target = [];
		foreach ($data as $item) {
			$kolom_target[] = $item[count($item)-1];
		}

		// menghitung nilai entropy

		$entropy_total = 0;
		foreach (array_count_values($kolom_target) as $t) {
			$entropy_total = $entropy_total - $t/$jumlah_data * log($t/$jumlah_data, 2);
		}

		/**
		 * untuk tiap atribut
		 * 		menghitung entropy tiap kasus
		 * 		menghitung gain
		 */

		foreach ($attributes as $indexAttribute => $label) {
			$data_kolom_atribut = []; // variabel untuk menampung data kolom atribut
			$data_kolom_target = []; // variabel untuk menampung data kolom target
			$data_atribut_and_target = [];

			foreach ($data as $key => $value) {
				$data_kolom_atribut[$key] = $value[$indexAttribute-1];
				$data_kolom_target[$key] = $value[count($value)-1];
				$data_atribut_and_target[] = [$value[$indexAttribute-1], $value[count($value)-1]];
			}

			$total_data = 0;
			$data_per_kasus = [];

			foreach ($data_atribut_and_target as $item) {
				if (!isset($data_per_kasus[$item[0]][$item[1]])) // jika data_per_kasus blm di set / kosong
					$data_per_kasus[$item[0]][$item[1]] = 1;
				else
					$data_per_kasus[$item[0]][$item[1]]++;
			}

			$lx = 0;
			$splitInfo = 0; // esj
			$labels[$indexAttribute] = [];
			foreach ($data_per_kasus as $case => $value) {
				$entropyAttribute = 0;
				$l = 0;
				$jumlah_case = array_sum($value); // menghitung total dari setiap array

				foreach ($value as $i => $v) {
					$pi = $v/$jumlah_case;
					$entropyAttribute = $entropyAttribute - $pi*log($pi, 2);
				}

				if ($entropyAttribute == 0) {
					$nilai_default = array_keys($value)[0]; // mengambil semua key pada []
					$labels[$indexAttribute][$case] = $nilai_default;
				}
				$leafs[$indexAttribute][$case] = $entropyAttribute;
				$lx += $jumlah_case/$jumlah_data*$entropyAttribute;
				$splitInfo += -($jumlah_case/$jumlah_data)*log($jumlah_case/$jumlah_data, 2); // esj
			}
			$gain = $entropy_total - $lx;
			
			if ($splitInfo != 0) {
				$gainRatio = $gain/$splitInfo; // esj	
			}
			else {
				$gainRatio = 0;
			}

			

			$gains[$indexAttribute] = $gain;
		}

		$l = arsort($gains); // urutkan angka besar -> kecil
		$root = array_keys($gains)[0];

		$this->rules[$root] = [];

		if ($base != null) {
			$this->rules[$base][$kasus] = [
				'kasus' => $kasus,
				'forward' => $root
			];
		}

		foreach ($leafs[$root] as $label => $entropy) {
			if ($entropy == 0) {
				$this->rules[$root][$label] = [
					'kasus' => $label,
					'nilai' => $labels[$root][$label]
				];
			}

			if ($entropy > 0 && $entropy <= 1) {
				if ($base != null) {
					// echo "Roote ".$root;
					$this->rules[$root][$label] = [
						'kasus' => $label.' - ',
						'forward' => $base+1
					];
				}

				else {
					$this->rules[$root][$label] = $label;
				}


				// hapus atribut yg telah menjadi root
				unset($attributes[$root]);

				$data_next_itarasi = [];

				foreach ($data as $index => $itemData) {
					if ($itemData[$root -1] == $label) {
						$data_next_itarasi[] = $itemData;
					}
				}
				$this->_hitung($data_next_itarasi, $attributes, $root, $label);
			}
		}
	}

	function _printRules($rules = null, $tab = 2) {
		$root = array_keys($rules)[0];
		$root_data = array_values($rules)[0];
		echo "<ul>";
		foreach ($root_data as $kasus => $data) {
			if (isset($data['nilai'])) {
				echo "<li>if ", strtoupper($root), " == ", strtoupper($kasus), "</li>";
				echo "&nbsp;&nbsp;&nbsp; return ", strtoupper($data['nilai']), "<br>";
			}
			if (isset($data['forward'])) {
				$l[$data['attribute']] = $data['forward'];
				echo "<li>if ", strtoupper($root), " == ", strtoupper($kasus), " </li>";
				$this->_printRules($l, $tab = $tab*2);
			}
		}
		echo "</ul>";
	}

	function generateRules() {
		$l = $this->_generateRules(array_values($this->rules)[0]);
		$x = array_keys($this->rules)[0];
		$rules[$this->attributes[$x]] = $l;
		$this->finalRules = $rules;
	}

	public $l = [];
	function _generateRules($i) {
		$l = $i;
		foreach ($i as $kasus => $item) {
			if (isset($item['forward'])) {
				$l[$kasus]['attribute'] = $this->attributes[$item['forward']];
				$l[$kasus]['forward'] = $this->_generateRules($this->rules[$item['forward']]);
			}
		}
		return $l;
	}

	function printRules() {
		$this->_printRules($this->finalRules);
	}

	function predictDataTesting(array $data = []) {
		$_data = array_combine($this->attributes, $data);
		$this->_predictDataTesting($_data, $this->finalRules);
		return $this->hasilPrediksi;
	}

	function _predictDataTesting(array $data, array $rules) {
		$attribute = array_keys($rules)[0];
		$kasusAttribute = array_values($rules)[0];

		foreach ($kasusAttribute as $kasus => $item) {
			if ($data[$attribute] == $kasus && isset($item['nilai'])) {
				$this->hasilPrediksi = strtoupper($item['nilai']);
			}

			if ($data[$attribute] == $kasus && isset($item['forward'])) {
				$ll[$item['attribute']] = $item['forward'];
				$this->_predictDataTesting($data, $ll);
			}
		}
	}
}

// aktive link pada menu bar
function active_link($path, $className = 'active') {
	$CI =& get_instance();
	$uri_string = $CI->uri->uri_string();

	// home is usually at / && has 0 total segments
	if ($path === '/' && ($CI->uri->total_segments() === 0)) {
		$ret_val = 'active';
	}
	else {
		$ret_val = ($uri_string === $path) ? $className : '';
	}

	return $ret_val;
}
