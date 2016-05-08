<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CommonHelper
{
	public static function _set_level_parent_id(&$result){
		$return =[];
		$i=0;
		foreach ($result as $key => $value) {
			if($value->parent_id==0){
				$return[$i]["main"]=$value;
				foreach ($result as $key_1 => $value_1) {
					if($value->id == $value_1->parent_id){
						$return[$i]["child"][]=$value_1;
					}
				}
				$i++;
			}
		}
		$result = $return;
	}
}
 ?>