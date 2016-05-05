<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products_model extends MY_Model {
	public $table = 'products'; // Set the name of the table for this model.
	public $primary_key = 'id'; // Set the primary key
	public function __construct(){
		$this->soft_deletes = FALSE;
		$this->timestamps = FALSE;
		$this->timestamps_format = 'Y-m-d H:i:s';
		$this->return_as = 'object';
		$this->has_many['product_images'] = ['foreign_model'=>'Product_images_model','foreign_table'=>'product_images','foreign_key'=>'product_id','local_key'=>'id'];
		parent::__construct();
	}

    public function paginate($rows_per_page, $total_rows = NULL, $page_number = 1)
    {
        $this->load->helper('url');
        $segments = $this->uri->total_segments();
        $uri_array = $this->uri->segment_array();
        $page = $this->uri->segment($segments);
        if(is_numeric($page))
        {
            $page_number = $page;
        }
        else
        {
            $page_number = $page_number;
            $uri_array[] = $page_number;
            ++$segments;
        }
        $next_page = $page_number+1;
        $previous_page = $page_number-1;

        if($page_number == 1)
        {
            $this->previous_page = $this->pagination_delimiters[0]."<span class='active'>".$this->pagination_arrows[0]."</span>".$this->pagination_delimiters[1];
        }
        else
        {
            $uri_array[$segments] = $previous_page;
            $uri_string = implode('/',$uri_array);
            $this->previous_page = $this->pagination_delimiters[0].anchor($uri_string,$this->pagination_arrows[0]).$this->pagination_delimiters[1];
        }
        $uri_array[$segments] = $next_page;
        $uri_string = implode('/',$uri_array);
        if(isset($total_rows) && (ceil($total_rows/$rows_per_page) == $page_number))
        {
            $this->next_page = $this->pagination_delimiters[0]."<span class='active'>".$this->pagination_arrows[1]."</span>".$this->pagination_delimiters[1];
        }
        else
        {
            $this->next_page = $this->pagination_delimiters[0].anchor($uri_string, $this->pagination_arrows[1]).$this->pagination_delimiters[1];
        }

        $rows_per_page = (is_numeric($rows_per_page)) ? $rows_per_page : 10;

        if(isset($total_rows))
        {
            if($total_rows!=0)
            {
                $number_of_pages = ceil($total_rows / $rows_per_page);
                $links = $this->previous_page;
                for ($i = 1; $i <= $number_of_pages; $i++) {
                    unset($uri_array[$segments]);
                    $uri_string = implode('/', $uri_array);
                    $links .= $this->pagination_delimiters[0];
                    $links .= (($page_number == $i) ? "<span class='active'>".$i."</span>" : anchor($uri_string . '/' . $i, $i));
                    $links .= $this->pagination_delimiters[1];
                }
                $links .= $this->next_page;
                $this->all_pages = $links;
            }
            else
            {
                $this->all_pages = $this->pagination_delimiters[0].$this->pagination_delimiters[1];
            }
        }


        if(isset($this->_cache) && !empty($this->_cache))
        {
            $this->load->driver('cache');
            $cache_name = $this->_cache['cache_name'].'_'.$page_number;
            $seconds = $this->_cache['seconds'];
            $data = $this->cache->{$this->cache_driver}->get($cache_name);
        }

        if(isset($data) && $data !== FALSE)
        {
            return $data;
        }
        else
        {
            $this->trigger('before_get');
            $this->where();
            $this->limit($rows_per_page, (($page_number-1)*$rows_per_page));
            $data = $this->get_all();
            if($data)
            {
                if(isset($cache_name) && isset($seconds))
                {
                    $this->cache->{$this->cache_driver}->save($cache_name, $data, $seconds);
                    $this->_reset_cache($cache_name);
                }
                return $data;
            }
            else
            {
                return FALSE;
            }
        }
    }
}

/* End of file Kyniem.php */
/* Location: ./application/models/Kyniem.php */